{
  description = "Nix Flake for OpenAquaponics with HydraMesh and NixOS on RPi 5 Cluster";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";  # For Hyprland
    raspberry-pi-nix.url = "github:nix-community/raspberry-pi-nix";
    sops-nix.url = "github:Mic92/sops-nix";  # For secrets
    hydramesh = {
      url = "github:ALH477/HydraMesh";
      flake = false;
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, raspberry-pi-nix, sops-nix, hydramesh, flake-utils } @ inputs:
    flake-utils.lib.eachSystem ["aarch64-linux"] (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      unstable = nixpkgs-unstable.legacyPackages.${system};

      # Common node configuration module
      commonModule = { config, pkgs, ... }: {
        imports = [ "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix" ];
        hardware.raspberry-pi = {
          config.all.enable = true;  # Vendor kernel for RPi 5
          firmware.enable = true;    # Full firmware support
        };
        environment.systemPackages = [ self.packages.${system}.hydramesh pkgs.podman pkgs.k3s ];
        services.openssh.enable = true;
        networking = {
          wireless = {
            enable = true;
            networks."${builtins.getEnv "WIFI_SSID"}".psk = "${builtins.getEnv "WIFI_PSK"}";
          };
          hostName = "rpi5-node${config.nodeNum}";
        };
        virtualisation.podman.enable = true;  # For ML isolation
        systemd.services.hydramesh = {
          enable = true;
          description = "HydraMesh Service for Aquaponics";
          script = "${self.packages.${system}.hydramesh}/bin/hydramesh start --config /etc/hydramesh/config.json";
          wantedBy = [ "multi-user.target" ];
        };
        systemd.services.aquaponics-sensors = {
          enable = true;
          description = "Aquaponics Sensor Monitoring";
          script = "python /etc/aquaponics/code/python/sensor_monitor.py";
          wantedBy = [ "multi-user.target" ];
        };
        sops.defaultSopsFile = ./secrets.yaml;  # Encrypted secrets
        sops.age.keyFile = "/var/lib/sops-nix/key.txt";
        users.users.nixos.openssh.authorizedKeys.keys = [ "${builtins.getEnv "SSH_PUBKEY"}" ];
      };

      # Function to generate node configs
      mkNodeConfig = { nodeNum, isHead ? false }: nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit nodeNum; };
        modules = [
          raspberry-pi-nix.nixosModules.raspberry-pi
          sops-nix.nixosModules.sops
          commonModule
          ({ config, pkgs, ... }: {
            services.k3s = {
              enable = true;
              role = if isHead then "server" else "agent";
              extraFlags = "--flannel-backend=none --disable-network-policy";
              serverAddr = if isHead then null else "https://rpi5-node1:6443";
              token = config.sops.secrets.k3s-token.path;  # From sops
            };
            # Head node UX and initiation logic
            config = if isHead then {
              services.xserver = {
                enable = true;
                desktopManager.xfce.enable = true;
              };
              programs.hyprland = {
                enable = true;
                package = unstable.hyprland;
              };
              services.displayManager.sddm.enable = true;
              systemd.services.cluster-init = {
                enable = true;
                description = "Initialize Aquaponics Cluster Workers";
                wantedBy = [ "multi-user.target" ];
                serviceConfig = {
                  ExecStart = "${pkgs.bash}/bin/bash /etc/nixos/init-workers.sh";
                  Type = "oneshot";
                };
              };
            } else {};
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
          cp target/release/libstreamdb.so $out/lib/

          cd ../c_sdk && mkdir build && cd build && cmake .. && make

          cd ../../perl && perl Makefile.PL && make install DESTDIR=$out

          cd ../python && python setup.py install --prefix=$out

          cd ../lisp && sbcl --load src/d-lisp.lisp --eval '(save-lisp-and-die "hydramesh-lisp.core")'
          cp hydramesh-lisp.core $out/bin/hydramesh-lisp
        '';

        installPhase = ''
          mkdir -p $out/bin $out/lib $out/share/hydramesh
          cp -r * $out/share/hydramesh/
          ln -s $out/share/hydramesh/bin/hydramesh $out/bin/hydramesh
        '';

        meta = with pkgs.lib; {
          description = "Low-latency P2P communication framework";
          license = licenses.gpl3;
          platforms = platforms.linux;
        };
      };

      devShell = pkgs.mkShell {
        packages = with pkgs; [
          self.packages.${system}.hydramesh
          podman sbcl rustc cargo
        ];
        shellHook = ''
          echo "OpenAquaponics dev shell with HydraMesh loaded!"
          export HYDRA_MESH_PATH="$PWD"
        '';
      };

      nixosConfigurations = nixpkgs.lib.genAttrs
        (builtins.genList (n: "rpi5-node${toString (n+1)}") 4)
        (name: let
          nodeNum = builtins.substring 9 1 name;
          isHead = nodeNum == "1";
        in mkNodeConfig { inherit nodeNum isHead; });
    });
}
```

#### **Generated Secrets File: `secrets.yaml`**

This file stores encrypted secrets (k3s token, SSH keys) for sops-nix. Create it in the repo root and encrypt with `sops secrets.yaml`.

<xaiArtifact artifact_id="309f018f-21b4-40f0-9cfc-44abba6e176c" artifact_version_id="b249adf5-451a-4564-9e3b-27ee82712fd6" title="secrets.yaml" contentType="text/yaml">

```yaml
k3s-token: ENC[AES256_GCM,data:...,type:str]  # Replace with actual encrypted token
ssh-pubkey: ENC[AES256_GCM,data:...,type:str]  # Replace with actual encrypted key
```

**Note**: Generate secrets with `sops --encrypt secrets.yaml` after setting up an age key (`age-keygen -o /var/lib/sops-nix/key.txt` on each node).

#### **How to Use**
1. **Clone Repo**: `git clone https://github.com/DeMoD-LLC/OpenAquaponicsContainer.git && cd OpenAquaponicsContainer`.
2. **Save flake.nix**: Place the above content in `flake.nix`.
3. **Generate Secrets**: Create `secrets.yaml`, encrypt with sops.
4. **Build Images**: Run `nix build .#nixosConfigurations.rpi5-node1.config.system.build.sdImage` (repeat for node2, node3, node4).
5. **Flash Images**: `sudo dd if=result/sd-image/nixos-sd-image-*.img of=/dev/sdX bs=4M status=progress conv=fsync`.
6. **Boot**: Insert SDs, power on; head node boots to SDDM, workers to SSH.

#### **Next Steps**
- **Automate Flashing**: Use the provided `create-flakes-and-compile.sh` to automate flake generation and builds.
- **Verify Cluster**: On head node, run `k3s kubectl get nodes` and `hydramesh health-check rpi5-node2.local`.
- **Add ML**: Deploy Podman containers for TensorFlow Lite via `virtualisation.podman` configs.

This flake ensures fast, reproducible cluster setup. If you need `init-workers.sh` updates or ML container configs, let me know!
