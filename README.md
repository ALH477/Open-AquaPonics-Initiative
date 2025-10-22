# OpenAquaponics Container Initiative

[![License: CERN-OHL-S-2.0](https://img.shields.io/badge/License-CERN--OHL--S--2.0-blue.svg)](https://cern-ohl.web.cern.ch/)
[![License: GPL-3.0](https://img.shields.io/badge/License-GPL--3.0-green.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Status: WIP](https://img.shields.io/badge/Status-WIP-yellow.svg)](https://github.com/DeMoD-LLC/OpenAquaponicsContainer)
[![Developed by DeMoD LLC](https://img.shields.io/badge/Developed%20by-DeMoD%20LLC-blue)](https://demod.ltd/)

## Project Overview

The **OpenAquaponics Container Initiative** is a work-in-progress (WIP) open-source project to develop a regenerative, self-contained aquaponics system within a repurposed 20-foot high-cube shipping container, augmented by a triangular lean-to greenhouse. It addresses urban food insecurity by combining aquaculture (50-100 tilapia, 200-400 lbs/year) and hydroponics (1,000-1,500 lbs produce like lettuce, basil, strawberries) in a closed-loop ecosystem. The system runs on NixOS across a 3-4 node Raspberry Pi 5 cluster, with **HydraMesh/DeMoD Communication Framework (DCF)** for low-latency P2P communication, Podman for ML isolation, and permaculture principles for sustainability.

**Key Objectives**:
- **Food Security**: Deliver 1,200-1,800 lbs annual output, supporting 50-100 households.
- **Sustainability**: Carbon-negative via hempcrete insulation, rainwater harvesting (30-50% water needs), and polyculture guilds.
- **Automation**: AI-driven RPi 5 cluster with HydraMesh/DCF (<5ms latency) for sensors, dosing, and control.
- **Scalability**: Modular for educational kits or multi-unit farms; open-source under CERN-OHL-S-2.0 (hardware) and GPL-3.0/MIT (software).
- **Cost-Effectiveness**: $24,250-$43,500 total, with 10% savings from recycled materials.

**Status**: WIP, seeking contributions and grant funding (e.g., USDA Sustainable Agriculture). Join us to build resilient urban food systems!

## Project Proposal

### Executive Summary
As of October 22, 2025, the OpenAquaponics Container Initiative proposes a carbon-negative aquaponics system to combat urban food deserts (affecting 23.5M Americans, USDA). With a budget of $24,250-$43,500, it integrates permaculture, AI automation via HydraMesh/DCF on NixOS, and renewables (solar/wind, sodium-ion batteries). Expected outcomes: 30-50% water savings vs. traditional farming, 15-25% yield boost, and outreach to 200+ students/year. We seek $30,000 in seed funding for a pilot, targeting replication in 3-5 communities within 2 years. Credit to **Asher LeRoy** for design refinements.

### 1.0 Problem Statement
Urban areas (55% global population) face food access challenges, with supply chain disruptions driving 10-20% price spikes (USDA, 2020-2022). Traditional agriculture consumes 70% of freshwater and emits 24% of greenhouse gases (FAO). This project decentralizes production, reducing transport emissions by up to 90% and enhancing equity in underserved areas.

### 2.0 Proposed Solution
A modular aquaponics unit in a recycled container with a greenhouse, leveraging:
- **Closed-Loop System**: Fish waste fertilizes plants; plants filter water.
- **Permaculture**: Guilds, biodiversity, edge maximization.
- **Automation**: HydraMesh/DCF for low-latency IoT (sensors, dosing, feeding) on NixOS RPi 5 cluster.
- **Renewables**: Off-grid solar/wind with 4-6 days autonomy.

### 3.0 System Design and Features
#### 3.1 Structural Design
- **Container**: 20'L x 8'W x 9.5'H high-cube ($2,000-$4,000); 1-3 welded I-beams ($300-$900).
- **Greenhouse**: Triangular lean-to (12' base, 12' peak, 240 sq ft; $4,500-$6,500); polycarbonate glazing ($3,200-$4,000).
- **Insulation**: Hempcrete (R-8-12, $1,800-$3,000); optional thermal blanket (R-5-7, $600-$1,500) for 15-25% heating savings.

#### 3.2 Aquaponics and Permaculture
- **Fish Tank**: 1,000-gal concrete at peak ($600-$1,800); MBBR biofilter ($200).
- **Grow Beds/NFT**: 3-4 terraced beds + vertical channels ($1,150-$2,500); guilds (e.g., basil-tomatoes).
- **Water System**: Gravity-fed stainless pipes ($700-$1,100); turbine ($600-$1,200); UV sterilizer ($150); rainwater harvesting ($200-$500).

#### 3.3 Advanced Automation and HydraMesh/DCF
- **RPi 5 Cluster**: 3-4 nodes ($320) on NixOS; HydraMesh/DCF for <5ms latency P2P (MQTT over UDP/gRPC with AES-256-GCM). Head node (rpi5-node1) has XFCE/Hyprland + SDDM UX and initiation logic.
- **Services**: Node-RED for flows; Python for AI (TensorFlow Lite); OpenCV for cameras; Podman for ML isolation.
- **Tracks**: Motorized rails for LEDs/cameras ($2,200-$5,300); blanket control.
- **HydraMesh/DCF**: Inter-node messaging (e.g., MQTT topics like `aquaponics/sensors/pH`); self-healing mesh with RTT-based grouping (<50ms).

#### 3.4 Energy
- **Generation**: 1-2 kW solar + 0.5-1 kW wind ($1,400-$2,200); welded frame ($600-$1,200).
- **Storage**: Sodium-ion batteries (9.6-19.2 kWh, $2,800-$3,400); MPPT controller ($300-$500).

#### 4.0 Community Impact and Educational Potential
- **Food Security**: Supplements 50-100 households; 90% reduced transport emissions.
- **Education**: STEM lab for 200+ students/year; hands-on aquaponics/permaculture learning.
- **Sustainability**: Carbon-negative (hempcrete sequesters ~1.5 kg CO2/kg); 30-50% water savings.
- **Open-Source**: CERN-OHL-S-2.0/GPL-3.0 for global replication (target: 5 communities in 3 years).

#### 5.0 Implementation Plan and Timeline
- **Phase 1: Site Prep** (1 month): Level ground, swales ($2,000).
- **Phase 2: Assembly** (2 months): Weld frame, glaze, insulate ($15,000).
- **Phase 3: Integration** (1 month): Systems, automation ($5,000).
- **Phase 4: Commissioning** (4-6 weeks): Cycle bacteria, stock ($2,000).

#### 6.0 Financial Overview and Budget
| Category              | Cost Range         | Notes                          |
|-----------------------|--------------------|--------------------------------|
| Container + Greenhouse| $7,000-$11,000     | +5% for polycarbonate          |
| Aquaponics            | $3,500-$7,000      | MBBR/UV included               |
| Automation            | $1,200-$2,500      | RPi cluster + HydraMesh + AI   |
| Power                 | $6,000-$9,500      | Solar/wind hybrid              |
| Insulation/Blanket    | $2,400-$4,500      | Hempcrete + blanket            |
| Misc./Labor           | $4,150-$8,500      | DIY with 10% buffer            |
| **Total**             | **$24,250-$43,500**| Mid-range for 2025 systems     |

#### 7.0 Conclusion and Call to Action
This initiative offers a scalable solution to urban food insecurity. We seek $30,000 seed funding for a pilot. Contact DeMoD LLC to align with funding priorities.

#### 8.0 Team and Acknowledgments
- **Lead**: DeMoD LLC Engineering Team.
- **Acknowledgments**: Special credit to **Asher LeRoy** for HydraMesh/DCF and system design contributions.

#### 9.0 Appendices
- **Schematic**: See `/cad` for FreeCAD files.
- **References**: USDA, FAO, permaculture literature.

---

## Installation and Setup

### Prerequisites
- **Hardware**: 3-4 Raspberry Pi 5 (8GB RAM), 16GB+ SD cards, MIG welder, container materials.
- **Software**: Nix (via Determinate: `curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install`), HydraMesh repo (`git clone https://github.com/ALH477/HydraMesh.git`).
- **Network**: Static IPs or mDNS (e.g., rpi5-node1.local); SSH keys for host.

### Steps
1. **Clone Repo**:
   ```bash
   git clone https://github.com/DeMoD-LLC/OpenAquaponicsContainer.git
   cd OpenAquaponicsContainer


Generate Flake and Images:
bash create-flakes-and-compile.sh 3  # For 3 nodes; change to 4 if needed


Flash SD Cards:
sudo dd if=result/sd-image-rpi5-node1/sd-image/nixos-sd-image-*.img of=/dev/sdX bs=4M status=progress conv=fsync
# Repeat for node2, node3, etc.


Boot Nodes: Insert SDs, power on. Head node (rpi5-node1) boots to SDDM; workers are headless (SSH: nixos@rpi5-node2.local).

Verify Cluster:

On head: k3s kubectl get nodes (shows all nodes); hydramesh health-check rpi5-node2.local.



Usage

Dashboard: On head node, use XFCE/Hyprland to access Portainer (port 9000) or TUI via hydramesh --tui.
HydraMesh CLI: hydramesh send "pH: 6.8" rpi5-node2.local:50051 for testing.
ML with Podman: podman run -v /sensor-data:/data tensorflow/tensorflow:arm64 python /app/ml_predictive.py.
Maintenance: Weekly sensor checks; monthly filter cleaning; logs in StreamDB (hydramesh db-query /metrics/).

HydraMesh/DCF Integration
HydraMesh (DCF) enables <5ms P2P communication for the RPi cluster (e.g., MQTT for sensors/actuators). Installed natively via Nix flake.
Example: Python Sensor Communication
import grpc
from hydramesh.services_pb2_grpc import HydraMeshServiceStub
from hydramesh.messages_pb2 import HydraMeshMessage

channel = grpc.insecure_channel('rpi5-node2.local:50051')
stub = HydraMeshServiceStub(channel)
request = HydraMeshMessage(data='pH: 6.8, Temp: 75F', recipient='rpi5-node2')
response = stub.SendMessage(request)
print(f"Response: {response.data}")

Example: D-LISP with StreamDB
(in-package :d-lisp)
(dcf-quick-start-client "/etc/hydramesh/config.json")
(dcf-quick-send "pH: 6.8, Temp: 75F" "rpi5-node2.local:50051")
(dcf-db-insert "/aquaponics/metrics/pH" "6.8")
(print (dcf-db-query "/aquaponics/metrics/pH"))

ML Processes with Podman
For intensive ML (e.g., TensorFlow Lite), use Podman (daemonless, OCI-compatible) via NixOS config (virtualisation.podman.enable = true).
podman run --rm -v /sensor-data:/data docker.io/tensorflow/tensorflow:2.10.0-arm64 python /app/code/python/ml_predictive.py

Contributing

Fork, submit PRs with tests (FiveAM for Lisp, pytest for Python).
Focus: Nix configs, HydraMesh plugins (e.g., LoRaWAN for remote sensors).
Follow CONTRIBUTING.md.

License/Acknowledgments

Hardware: CERN-OHL-S-2.0
Software: GPL-3.0 (core), LGPL-3.0 (libraries), MIT (docs/scripts)
Acknowledgments: Asher LeRoy (DeMoD LLC founder) for HydraMesh/DCF and system design; Grok 4 Heavy (xAI) for AI optimizations; community forums (Permies, Reddit).


# DeMoD LLC | Cut the bullshit, Cut the price. Innovation without the overhead.
```
  ___   _      _   _   ___  ____________          ______    ___  ___     ______   _      _     _____ 
 / _ \ | |    | | | | /   ||___  /___  /          |  _  \   |  \/  |     |  _  \ | |    | |   /  __ \
/ /_\ \| |    | |_| |/ /| |   / /   / /   ______  | | | |___| .  . | ___ | | | | | |    | |   | /  \/
|  _  || |    |  _  / /_| |  / /   / /   |______| | | | / _ \ |\/| |/ _ \| | | | | |    | |   | |    
| | | || |____| | | \___  |./ /  ./ /             | |/ /  __/ |  | | (_) | |/ /  | |____| |___| \__/\
\_| |_/\_____/\_| |_/   |_/\_/   \_/              |___/ \___\_|  |_/\___/|___/   \_____/\_____/\____/
```
