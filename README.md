# OpenAquaponics Container Initiative

[![License: CERN-OHL-S-2.0](https://img.shields.io/badge/License-CERN--OHL--S--2.0-blue.svg)](https://cern-ohl.web.cern.ch/)
[![WIP](https://img.shields.io/badge/Status-WIP-yellow.svg)](https://github.com/yourusername/OpenAquaponicsContainer)

## Project Overview

The OpenAquaponics Container Initiative is an open-source project to develop a self-contained, regenerative food production unit using a repurposed 20-foot shipping container augmented with a greenhouse extension. This system combines aquaponics with permaculture principles, advanced automation, and renewable energy to address urban food insecurity. It is designed to be scalable, sustainable, and replicable, providing fresh fish and produce while serving as an educational tool for communities.

**Status**: This repository is a Work In Progress (WIP). Contributions are welcome! See the [Contributing](#contributing) section.

## Features

- **Sustainable Design**: Carbon-negative operation with hempcrete insulation, gravity-fed water circulation, and permaculture guilds for biodiversity.
- **Automation**: Raspberry Pi 5 clustering with Docker Swarm/k3s for AI-driven monitoring, nutrient dosing, fish feeding, and insulated blanket control.
- **Energy Independence**: Hybrid solar/wind power with sodium-ion batteries for off-grid operation.
- **Yield Potential**: 200-400 lbs of tilapia and 1,000-1,500 lbs of produce annually.
- **Modular and Open-Source**: Licensed under CERN-OHL-S-2.0 for hardware and GPL v3 for software, enabling community adaptations and educational kits.

## Project Proposal

Below is the full project proposal document, which outlines the vision, design, implementation, and impact.

---

Project Proposal: The OpenAquaponics Container Initiative for Sustainable Urban Food Production

1.0 Introduction: Addressing the Urban Food Challenge

Modern cities face a foundational challenge to their long-term viability: securing local, resilient, and sustainable food sources. The prevalence of urban food deserts and the systemic vulnerabilities of global supply chains are not minor inconveniences; they are critical infrastructure deficits. To build the resilient, self-sufficient cities of the 21st century, we must treat localized food production as an essential infrastructure investment.

This proposal directly confronts the lack of accessible, fresh, and sustainably grown food in urban environments. The current centralized model of food distribution is an outdated paradigm—environmentally costly, energy-intensive, and dangerously fragile. This initiative presents a strategic advantage by decentralizing production and embedding a regenerative food system directly within the community it serves.

The "OpenAquaponics Container Initiative" is our proposed solution: a project to implement a self-contained, regenerative food production unit that serves as a best-in-class model for community-based agriculture. The project's overarching goal is to deploy a future-proof prototype that demonstrates how advanced technology, permaculture principles, and an open-source philosophy create a powerful, replicable, and sustainable local food source. This document provides a detailed overview of the proposed aquaponics system and its strategic value.

2.0 Proposed Solution: The Open-Source Aquaponics Container System

A container-based aquaponics system represents an ideal solution for the modern urban landscape. Its modularity allows for strategic placement in underutilized spaces, its closed-loop design ensures unparalleled resource efficiency, and its controlled environment guarantees consistent, year-round production. This approach transforms a ubiquitous industrial object into a high-performance hub of local nourishment and education.

The proposed system is a self-contained, regenerative food production unit housed within a repurposed 20-foot high-cube shipping container, which is augmented with an attached greenhouse to maximize growing space. The system’s core function is based on a closed-loop nutrient cycle that mimics natural ecosystems. Fish, housed in an elevated tank, produce nutrient-rich waste. This water is then circulated to plant grow beds, where plants absorb the nutrients for growth while simultaneously filtering and purifying the water before it returns to the fish. This symbiotic relationship dramatically reduces water consumption and eliminates the need for synthetic fertilizers.

The system is engineered to achieve key objectives that deliver a high-impact, replicable solution:

* Sustainability: To achieve carbon-negative operation through the strategic use of hempcrete insulation, a fully integrated renewable energy system, and the application of permaculture principles that enhance biodiversity and reduce waste.
* Efficiency: To minimize operational costs and labor by utilizing a gravity-fed water flow that recovers 15-30% of potential energy and by implementing an AI-driven automation system for low-maintenance operation.
* Scalability: To leverage a modular design that is equally suitable as a single-unit community educational hub or as a component in a larger, multi-container urban farm, with all designs being open-source to encourage global replication.
* High Yield: To provide a significant source of local food, with an optimized annual output of 200-400 lbs of tilapia and 1,000-1,500 lbs of fresh produce, such as lettuce, herbs, and strawberries.
* Cost-Effectiveness: To deliver a high-value system with a total estimated cost of $24,250 - $43,500, with the potential for additional savings through the sourcing of recycled materials.

This integrated system is not merely a farm but a comprehensive platform for sustainable urban living, whose innovative design warrants a more detailed examination.

3.0 System Design and Innovative Features

Our design philosophy integrates four pillars—robust structural integrity, deeply integrated agricultural methods, advanced automation, and complete energy independence—to create a uniquely resilient and productive system. This synergistic combination ensures the project is not only high-yield but also exceptionally durable and sustainable, setting a new benchmark for urban agriculture.

3.1 Structural and Architectural Design

The foundation of the unit is a repurposed 20-foot high-cube Corten steel shipping container. This choice is strategic; it leverages the container's exceptional durability while immediately aligning with circular economy principles. By upcycling an existing industrial product, we adhere to the core permaculture principle to "produce no waste" and significantly reduce the project's initial embodied carbon—a key metric for sustainability-focused funders.

Attached to the container is a triangular lean-to greenhouse extension, precisely engineered to maximize solar gain. Its equator-facing glazing, constructed from 6mm twin-wall polycarbonate, provides excellent light transmission and thermal insulation. This structure expands the total productive growing area by approximately 240 square feet.

For superior climate control, the container and the exterior of the main fish tank are insulated with a 4-6" layer of hempcrete. This natural, carbon-sequestering material provides excellent thermal regulation (R-8 to R-12) and acts as a breathable barrier, naturally controlling humidity and preventing mold.

3.2 Aquaponics and Permaculture Integration

At the heart of the agricultural system is a 1,000-gallon concrete fish tank, strategically mounted at the peak of the greenhouse. This elevated placement enables a gravity-fed water circulation system, a key design feature that drastically reduces the energy consumption typically associated with water pumps.

The system integrates a diverse range of growing methods to maximize yield and biodiversity:

* Media Grow Beds: Large beds filled with clay pebbles provide an ideal medium for rooting crops and host the beneficial bacteria essential for nutrient conversion.
* Vertical NFT Channels: To maximize the use of vertical space, the system incorporates stainless steel vertical channels for growing leafy greens and herbs. The choice of stainless steel is deliberate; it is durable, food-safe, and easily sterilized, reinforcing the system's longevity and the quality of its produce.
* Permaculture Guilds: The layout incorporates companion planting, or "guilds," where mutually beneficial plants are grown together. Planting basil alongside tomatoes, for example, naturally repels pests and enhances the symbiotic health of the micro-ecosystem.

Water conservation is a paramount feature, driven by the permaculture principle to "catch and store energy." A rainwater harvesting system collects runoff from the greenhouse roof, meeting 30-50% of the system's total water needs. This, combined with the closed-loop aquaponics cycle, results in minimal water usage compared to conventional agriculture.

3.3 Advanced Automation and Monitoring

The system's "brain" is a low-power Raspberry Pi 5 computer cluster. This efficient computing solution runs a suite of containerized software services that handle automation, environmental monitoring, and AI-driven predictive analysis, significantly reducing the need for manual labor and optimizing growing conditions 24/7.

Key automated functions include:

* AI-Powered Feeding System: An underwater camera monitors fish behavior, and an AI model adjusts feeding schedules based on activity levels. This smart system reduces feed waste by an estimated 10-20%.
* Automated Nutrient Dosing: A network of sensors continuously monitors water chemistry, and automated peristaltic pumps dose precise amounts of organic supplements as needed to maintain optimal NPK levels.
* Robotic Ceiling Track System: A motorized trolley moves along ceiling-mounted rails, carrying high-efficiency LED lighting and multi-spectral cameras. This allows for targeted light delivery and advanced plant health monitoring, enabling early detection of stress or disease.
* Automated Insulated Blanket: A custom thermal blanket automatically deploys over the greenhouse glazing at night, conserving heat and saving an estimated 15-25% on heating energy.

3.4 Renewable Energy System

The project is designed for complete energy self-sufficiency, ensuring operational resilience and a carbon-negative footprint. Power is generated by a hybrid system featuring 1-2 kW of solar panels and 0.5-1 kW of wind turbines, capturing energy in varied weather conditions.

Energy is stored in a 9.6-19.2 kWh sodium-ion battery bank. This modern battery technology provides a projected autonomy of 4-6 days, ensuring the system remains fully operational even during extended periods of low sun or wind. This commitment to energy independence makes the unit a true off-grid, future-proof solution.

These advanced technical features are the means to deliver tangible, lasting benefits to the community.

4.0 Community Impact and Educational Potential

The OpenAquaponics Container Initiative is designed to deliver value far beyond food production. It is an investment in resilience—a living community asset that serves as a hub for education, a catalyst for engagement, and a tangible demonstration of a sustainable future.

The project’s primary benefits for the community include:

1. Enhancing Food Security: The system provides a consistent, reliable, and highly local source of fresh produce and protein. With a productive capacity of 1,200 to 1,800 pounds of total output annually, it directly supplements the nutritional needs of local families, schools, or community centers, increasing access to healthy food where it is needed most.
2. Educational Hub: The container serves as a dynamic, hands-on learning laboratory. It offers a unique opportunity for local schools and community groups to engage with concepts in STEM, sustainable agriculture, biology, and permaculture. Students can learn about closed-loop ecosystems, automation, and renewable energy in a real-world setting.
3. Model for Sustainability: The project's carbon-negative design, radical water conservation, and complete reliance on renewable energy make it a powerful, visible example of sustainable urban living. It demonstrates that advanced, eco-friendly technology can be practical and accessible, inspiring community members to adopt more sustainable practices.
4. Open-Source Philosophy: The entire project is governed by the CERN-OHL-S-2.0 license. This commitment is fundamental, ensuring all designs, software, and documentation remain publicly and freely available. This empowers other communities—locally and globally—to replicate, adapt, and improve upon the design, fostering a collaborative, worldwide effort to build more resilient food systems.

Having established the project’s significant benefits, the next section outlines the practical plan for its successful implementation.

5.0 Project Implementation Plan and Timeline

To ensure a successful and timely deployment, this project will be executed using a clear, phased approach that covers all stages from groundbreaking to full biological operation. This methodical plan, developed from detailed design specifications, mitigates risk and provides clear milestones for progress over a total estimated duration of 4 to 6 months.

The project implementation is structured into the following sequential phases:

* Phase 1: Site Preparation (1 month): This initial phase involves preparing the designated location. Key activities include ground leveling, establishing a permeable foundation, and the final placement of the shipping container.
* Phase 2: Structural Assembly (2 months): This is the primary construction phase. It includes cutting openings in the container, welding the greenhouse frame, installing the polycarbonate glazing, and applying the hempcrete insulation.
* Phase 3: System Integration (1 month): With the main structure complete, this phase focuses on installing the internal systems. This includes plumbing the complete water circulation system, installing the automation hardware and sensors, and wiring the renewable power system.
* Phase 4: Biological Commissioning (4-6 weeks): The final phase brings the ecosystem to life. The system is first "cycled" to establish a healthy colony of beneficial nitrifying bacteria, after which it is stocked with fish and initial plant crops to begin the first growth cycle.

Successful implementation assumes a level site with adequate southern exposure for solar gain and the acquisition of any necessary local permits. This structured timeline provides a clear roadmap for bringing the OpenAquaponics Container from concept to a fully operational community asset.

6.0 Financial Overview and Budget

The total estimated cost for the OpenAquaponics Container Initiative is between $24,250 and $43,500. This investment covers all materials, specialized components, and estimated DIY labor. The project's long-term value is realized through its high yield, operational efficiency driven by automation and energy recovery, and complete independence from external energy grids, ensuring low and predictable operating costs over its lifespan.

The detailed cost breakdown is as follows:

Component/Category	Estimated Cost Range
Container Base & Reinforcements	$2,300 - $4,900
Greenhouse Structure	$4,500 - $6,500
Fish Tank & Biofilter	$900 - $2,200
Grow Beds/NFT System	$1,150 - $2,500
Water & Plumbing System	$1,450 - $2,750
Dosing & Feeding Systems	$1,000 - $3,050
Automation Cluster (RPi 5)	$470 - $920
Ceiling Track & Robotics	$2,200 - $5,300
Renewable Power System	$5,000 - $7,200
Insulation & Climate Control	$2,400 - $4,500
Miscellaneous (Foundation, etc.)	$1,000 - $2,000
Materials Subtotal	$22,370 - $41,820
Estimated DIY Labor	$1,680 - $1,880
Grand Total	$24,250 - $43,500

Note: These figures are based on 2025 estimates. Total material costs can be optimized by up to 10% through the strategic sourcing of recycled components, further enhancing the project's sustainability and cost-effectiveness.

7.0 Conclusion and Call to Action

The OpenAquaponics Container Initiative is a timely and powerful response to the critical challenge of urban food insecurity. It is far more than a high-yield food production system; it is a fully integrated platform for building community resilience, providing hands-on STEM education, and demonstrating a viable path toward a sustainable urban future. By combining regenerative agriculture with advanced automation and an open-source philosophy, this project offers a scalable, adaptable, and replicable model for communities everywhere.

This initiative represents a strategic investment in a future where healthy food is accessible, communities are empowered with the tools for self-sufficiency, and technology serves both people and the planet. We are seeking strategic partners to pioneer this initiative and establish a new benchmark for urban sustainability. We welcome the opportunity to schedule a follow-up meeting to discuss funding opportunities and project partnerships in greater detail.

---

## Updated Briefing (October 21, 2025)

Here is the latest project briefing, summarizing key features, costs, and next steps.

---

### **Updated Briefing: Open-Source Shipping Container Aquaponics System (October 21, 2025)**

#### **Executive Summary**
As of October 21, 2025, this project outlines a fully integrated, permaculture-aligned aquaponics system housed in a 20-foot shipping container with a ground-extended right-angle triangular greenhouse. Designed for sustainable urban/rural food production, it combines aquaculture (50-100 tilapia) and hydroponics (1,000-1,500 lbs annual produce like lettuce, basil, and strawberries) in a closed-loop ecosystem. Key innovations include gravity-fed water flow, Raspberry Pi 5 clustering for AI-driven automation, motorized LED/multi-spectral camera tracks, automated water testing/NPK dosing, fish feeding with underwater camera, hempcrete insulation, sodium-ion batteries, solar/wind hybrid power, and an optional nighttime insulated blanket for thermal efficiency.

Recent market trends show the global aquaponics sector projected to exceed $1.3 billion by year-end, driven by modular container farms and AI/IoT integrations. Costs for similar systems range from $10,000-$35,000 for basic greenhouses to $30,000-$75,000 for hydroponic containers, aligning with our optimized estimate of $25,000-$45,000 (up 5-10% from 2024 due to material inflation but offset by recycled sourcing). Permaculture enhancements (e.g., biodiversity guilds, rainwater harvesting) boost yields 15-25% while cutting inputs 20-30%. The system is open-source (CERN-OHL-S-2.0 hardware, GPL v3 software) for replication, with a GitHub repo for CAD/code.

#### **Key Features and Permaculture Integration**
- **Structural Core**: Recycled 20ft high-cube container ($2,000-$4,000) as durable base, with triangular lean-to greenhouse (12' extension, 12' peak, polycarbonate glazing ~$3,200-$4,000). Permaculture: Vines on exterior for shading/carbon sequestration; permeable swales around foundation for water infiltration.
- **Aquaponics Loop**: 1,000-gal peak concrete tank ($600-$1,800) with MBBR biofilter ($200); 3-4 terraced media beds + vertical NFT channels ($1,150-$2,500); gravity-fed stainless piping with hydro turbine recovery (15-30% energy offset, $1,450-$2,750). Permaculture: Polyculture guilds (e.g., nitrogen-fixing beans with lettuce) and worm bins for natural pest control/soil building.
- **Automation Ecosystem**: 3-4 RPi 5 nodes in Docker Swarm/k3s cluster ($320); services for dosing (peristaltic pumps, $200-$900), feeding (servo dispenser, $50-$150), and monitoring (NPK sensors $600-$1,600). Motorized ceiling tracks for LEDs/cameras ($2,200-$5,300); underwater camera for fish behavior. AI (TensorFlow Lite) predicts needs from data trends. Permaculture: Feedback loops mimic natural interactions (e.g., adjust based on observed biodiversity).
- **Power and Energy**: 1-2 kW solar + 0.5-1 kW wind ($1,400-$2,200); sodium-ion batteries (9.6-19.2 kWh, $2,800-$3,400); 48V DC bus with load scheduling (20-30% savings). Permaculture: Biomass composting from waste for biogas potential.
- **Insulation and Climate Control**: Hempcrete (4-6" thick, R-8-12, $1,800-$3,000); optional insulated blanket (hemp wool core, R-5-7, $600-$1,500) rolls over hypotenuse at night (motorized, RPi-controlled, saving 15-25% heating). Recent innovations include adaptive controls for automated deployment based on thermal attenuation models. Permaculture: Natural zoning (warm fish-adjacent, cooler plant ends) with vine shades.
- **Water Management**: Rainwater harvesting via gutters ($200-$500, 30-50% needs met); UV sterilizer ($150). Permaculture: Swales and polyculture edges for filtration/diversity.

#### **Technical Specifications**
- **Dimensions/Capacity**: Container: 20'L x 8'W x 9.5'H; Greenhouse: ~240 sq ft growing area (expanded 20% via NFT); Tank: 1,000 gal (50-100 tilapia).
- **Power Draw**: 5-10 kWh/day (peak 1-2 kW); Autonomy: 4-6 days.
- **Automation Stack**: Raspberry Pi OS 64-bit; Docker for services (Node-RED, OpenCV, Python PID/AI); MQTT for inter-node; RTC/light sensors for timing.
- **Materials**: Non-plastic focus (stainless steel, hempcrete, recycled fabrics); R-values: Hempcrete R-8-12, blanket R-5-7.
- **Yield Projections**: 200-400 lbs fish + 1,000-1,500 lbs produce/year; 15-25% boost from permaculture guilds/AI.
- **Climate Adaptability**: Temperate baseline (e.g., 40-80°F); blanket for cold snaps; zoning for micro-climates.

#### **Updated Costs (2025 Adjusted)**
Based on current market data, costs reflect 5-10% inflation but 10% savings from recycled/permaculture sourcing:
| Category              | Cost Range         | Notes                          |
|-----------------------|--------------------|--------------------------------|
| Container + Greenhouse| $7,000-$11,000     | +5% for polycarbonate          |
| Aquaponics            | $3,500-$7,000      | MBBR/UV included               |
| Automation            | $1,200-$2,500      | RPi cluster + AI               |
| Power                 | $6,000-$9,500      | Solar/wind hybrid              |
| Insulation/Blanket    | $2,400-$4,500      | Hempcrete + optional blanket   |
| Misc./Labor           | $4,150-$8,500      | DIY with contingencies (10% buffer) |
| **Total**             | **$24,250-$43,500**| Mid-range for 2025 systems     |

#### **Benefits, Optimizations, and Risks**
- **Benefits**: 20-30% energy savings (scheduling + blanket); resilient permaculture loop (biodiversity reduces pests 15-20%); educational scalability (kits for schools).
- **Optimizations**: AI predictive dosing (15% yield boost); rainwater (40% water savings); blanket for cold resilience (10-15°C retention).
- **Risks/Mitigation**: Supply delays (multiple vendors); biological imbalances (AI monitoring + backups); permits (consult locals for aquaculture).

#### **Next Steps and Timeline**
- **Q4 2025**: Prototype blanket/automation (1-2 months).
- **Q1 2026**: Full build/site integration (3 months); cycle bacteria (4-6 weeks).
- **Resources**: GitHub repo for CAD/code; community forums (e.g., Permies.com for blanket DIY).

This briefing is current as of October 21, 2025, and ready for stakeholder review. For detailed specs or prototypes, provide feedback.

---

## Installation and Setup

### Prerequisites
- Basic welding tools (e.g., MIG welder) for frame construction.
- Raspberry Pi 5 (3-4 units) with Raspberry Pi OS.
- Access to recycled shipping container and materials like hempcrete.

### Steps
1. **Clone the Repository**:
   ```
   git clone https://github.com/yourusername/OpenAquaponicsContainer.git
   cd OpenAquaponicsContainer
   ```

2. **Build the Structure**: Follow the CAD files in `/cad` and welding templates in `/welding` to construct the container modifications and greenhouse frame.

3. **Set Up Automation**:
   - Install Docker: `curl -sSL https://get.docker.com | sh`
   - Initialize Swarm: `docker swarm init`
   - Deploy stacks from `/code/docker-compose.yml`.

4. **Biological Startup**: Cycle the system with bacteria for 4-6 weeks before stocking fish and plants.

Detailed guides are in `/docs`.

## Usage

- **Monitoring Dashboard**: Access via Portainer on the RPi manager node (default port 9000).
- **Customization**: Edit Python scripts in `/code` for AI models or adjust parameters in Node-RED flows.
- **Maintenance**: Weekly sensor checks; monthly filter cleaning. Use the AI container for predictive alerts.

## Contributing

This is a WIP project—help us improve! 
- Fork the repo and create a pull request.
- Issues: Report bugs or suggest features.
- Guidelines: Follow CERN-OHL-S-2.0 for hardware; GPL v3 for code. Credit original contributors.

Special thanks to Asher LeRoy for design refinements.

## License

Hardware: CERN-OHL-S-2.0  
Software: GPL v3 / LGPL v3 / MIT (see LICENSE files).  

## Acknowledgments

- Asher LeRoy: For technical contributions to design and automation.
- DeMoD LLC: Project sponsorship.
- Community: Open-source inspirations from aquaponics forums and permaculture resources.
