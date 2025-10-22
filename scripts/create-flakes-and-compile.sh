#!/usr/bin/env bash

# create-flakes-and-compile.sh - Improved script to generate flake.nix, template configs, and compile NixOS SD images for RPi 5 cluster
# Usage: bash create-flakes-and-compile.sh [num_nodes] [--clean] (default num_nodes: 3)
# Improvements: Error handling, dynamic config templating with sed, parallel builds, nix flake check, image verification, cleanup option

set -euo pipefail  # Exit on errors, unbound vars, pipe failures

# Configurable variables (env vars for secrets/WiFi)
NUM_NODES=${1:-3}
CLEAN=${2:-false}
FLAKE_FILE="flake.nix"
TEMPLATE_FILE="configuration-template.nix"
OUTPUT_DIR="./result"
WIFI_SSID="${WIFI_SSID:-MyNetwork}"  # Set env var or default
WIFI_PSK="${WIFI_PSK:-password}"     # Secure this!
SSH_PUBKEY="${SSH_PUBKEY:-ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAI...}"  # Your pub key
K3S_TOKEN="${K3S_TOKEN:-my-secret-token}"  # Generate securely

# Step 1: Generate configuration-template.nix
echo "Generating $TEMPLATE_FILE..."
cat << EOF > $TEMPLATE_FILE
{ config, pkgs, ... }: let
  unstable = import nixpkgs-unstable { system = "aarch64-linux"; config.allowUnfree = true; };
in {
  hardware.raspberry-pi.config.all.enable = true;
  environment.systemPackages = [ self.packages.aarch64-linux.hydramesh pkgs.podman pkgs.k3s unstable.hyprland ];

  services.openssh.enable = true;
  networking.wireless = {
    enable = true;
    networks."$WIFI_SSID".psk = "$WIFI_PSK";
  };
  virtualisation.podman.enable = true;

  services.k3s = {
    enable = true;
    role = "ROLE_PLACEHOLDER";  # Replaced per node
    serverAddr = "https://rpi5-node1:6443";  # For agents
    token = "$K3S_TOKEN";  # Secure via sops in production
  };

  systemd.services.hydramesh = {
    enable = true;
    script = "\${self.packages.aarch64-linux.hydramesh}/bin/hydramesh start --config /etc/hydramesh/config.json";
    wantedBy = [ "multi-user.target" ];
  };

  systemd.services.aquaponics-sensors = {
    enable = true;
    script = "python /etc/aquaponics/code/python/sensor_monitor.py";
    wantedBy = [ "multi-user.target" ];
  };

  users.users.nixos.openssh.authorizedKeys.keys = [ "$SSH_PUBKEY" ];

  # UX only on head (node1)
  UX_PLACEHOLDER
}
EOF

# Step 2: Generate per-node configs from template
for i in $(seq 1 $NUM_NODES); do
  NODE_NAME="rpi5-node${i}"
  CONFIG_FILE="configuration-${NODE_NAME}.nix"
  
  cp $TEMPLATE_FILE $CONFIG_FILE
  
  if [ $i -eq 1 ]; then
    sed -i "s/ROLE_PLACEHOLDER/server/g" $CONFIG_FILE
    sed -i "s/serverAddr.*//g" $CONFIG_FILE  # Remove agent line for master
    sed -i "s/UX_PLACEHOLDER/services.xserver = { enable = true; desktopManager.xfce.enable = true; }; programs.hyprland = { enable = true; package = unstable.hyprland; }; services.displayManager.sddm.enable = true; systemd.services.cluster-init = { enable = true; description = \"Initialize Aquaponics Cluster Workers\"; wantedBy = [ \"multi-user.target\" ]; serviceConfig = { ExecStart = \"\${pkgs.bash}\/bin\/bash \/etc\/nixos\/init-workers.sh\"; Type = \"oneshot\"; }; };/g" $CONFIG_FILE
  else
    sed -i "s/ROLE_PLACEHOLDER/agent/g" $CONFIG_FILE
    sed -i "s/UX_PLACEHOLDER//g" $CONFIG_FILE  # No UX on workers
  done
done

# Step 3: Generate flake.nix with dynamic nixosConfigurations
echo "Generating $FLAKE_FILE..."
cat << EOF > $FLAKE_FILE
{
  description = "Nix Flake for OpenAquaponics with HydraMesh and NixOS on RPi 5 Cluster";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    raspberry-pi-nix.url = "github:nix-community/raspberry-pi-nix";
    sops-nix.url = "github:Mic92/sops-nix";  # For secrets
    hydramesh = {
      url = "github:ALH477/HydraMesh";
      flake = false;
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, raspberry-pi-nix, sops-nix, hydramesh, flake-utils } @ inputs:
    flake-utils.lib.eachSystem ["aarch64-linux"] (system: let  # Explicit aarch64 pinning
      pkgs = nixpkgs.legacyPackages.\${system};
      unstable = nixpkgs-unstable.legacyPackages.\${system};

      # Function to generate per-node configs
      mkNodeConfig = { nodeNum, isHead ? false }: nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          raspberry-pi-nix.nixosModules.raspberry-pi
          sops-nix.nixosModules.sops  # For secrets
          ./configuration-rpi5-node\${toString nodeNum}.nix  # Per-node file
          ({ config, pkgs, ... }: {
            sops.defaultSopsFile = ./secrets.yaml;  # Encrypted file for token/keys
            sops.age.keyFile = "/var/lib/sops-nix/key.txt";  # Example
          })
        ];
      };
    in {
      packages.hydramesh = pkgs.stdenv.mkDerivation rec {
        pname = "hydramesh";
        version = "5.0.1";

        src = hydramesh;

        nativeBuildInputs = with pkgs; [
          cmake pkg-config protobuf grpc rustc cargo perl python3 sbcl
        ];

        buildInputs = with pkgs; [
          libuuid json_c ncurses libserialport libsocketcan libsctp
        ];

        buildPhase = ''
          cd streamdb && cargo build --release
          cp target/release/libstreamdb.so \$out/lib/

          cd ../c_sdk && mkdir build && cd build && cmake .. && make

          cd ../../perl && perl Makefile.PL && make install DESTDIR=\$out

          cd ../python && python setup.py install --prefix=\$out

          cd ../lisp && sbcl --load src/d-lisp.lisp --eval '(save-lisp-and-die "hydramesh-lisp.core")'
          cp hydramesh-lisp.core \$out/bin/hydramesh-lisp
        '';

        installPhase = ''
          mkdir -p \$out/bin \$out/lib \$out/share/hydramesh
          cp -r * \$out/share/hydramesh/
          ln -s \$out/share/hydramesh/bin/hydramesh \$out/bin/hydramesh
        '';

        meta = with pkgs.lib; {
          description = "Low-latency P2P communication framework";
          license = licenses.gpl3;
          platforms = platforms.linux;
        };
      };

      devShell = pkgs.mkShell {
        packages = with pkgs; [
          self.packages.\${system}.hydramesh
          docker podman sbcl rustc cargo
        ];
        shellHook = ''
          echo "OpenAquaponics dev shell with HydraMesh loaded!"
          export HYDRA_MESH_PATH="\$PWD"
        '';
      };

      nixosConfigurations = nixpkgs.lib.genAttrs (builtins.genList (n: "rpi5-node\${toString (n+1)}") $NUM_NODES) (name: let
        nodeNum = builtins.substring 9 1 name;  # Extract number
        isHead = nodeNum == "1";
      in mkNodeConfig { inherit nodeNum isHead; });
    });
}
EOF

# Step 4: Validate flake
nix flake check || { echo "Flake check failed!"; exit 1; }

# Step 5: Compile SD images in parallel
for i in $(seq 1 $NUM_NODES); do
  NODE_NAME="rpi5-node${i}"
  echo "Compiling SD image for $NODE_NAME in background..."
  nix build .#nixosConfigurations.${NODE_NAME}.config.system.build.sdImage -o $OUTPUT_DIR/sd-image-${NODE_NAME} &
done
wait  # Wait for all background jobs

# Step 6: Verify images
for i in $(seq 1 $NUM_NODES); do
  IMG_FILE=$(find $OUTPUT_DIR/sd-image-rpi5-node${i}/sd-image -name "*.img" -type f)
  if [ -f "$IMG_FILE" ] && [ $(stat -c%s "$IMG_FILE") -gt 1000000000 ]; then  # Check >1GB
    echo "Image for rpi5-node${i} verified OK."
  else
    echo "Image verification failed for rpi5-node${i}!"
    exit 1
  fi
done

# Step 7: Optional Cleanup
if [ "$CLEAN" = "--clean" ]; then
  rm -rf $OUTPUT_DIR/*
  echo "Cleanup complete."
fi

echo "Flake generated and images compiled! Flash them to SD cards."
echo "Example: sudo dd if=$(find $OUTPUT_DIR/sd-image-rpi5-node1/sd-image -name '*.img') of=/dev/sdX bs=4M status=progress conv=fsync"
