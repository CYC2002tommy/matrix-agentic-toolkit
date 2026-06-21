# Skills Catalog

The skills catalog organizes agent skills into groups. Each group is a directory containing one or more skills (each with a `SKILL.md` and `manifest.yaml`).

## Skills

<!-- BEGIN SKILLS -->
### MatrixEngine Core (`matrix_engine-core`)

Create, debug, test, review, and manage MatrixEngine code and installations

| Skill | What it teaches your agent |
|-------|---------------------------|
| `matrix_engine-create-live-script` | Create plain-text MatrixEngine Live Scripts with rich text, LaTeX equations, and inline figures. |
| `matrix_engine-debugging` | Diagnose MatrixEngine errors and unexpected behavior. |
| `matrix_engine-install-products` | Install Open Community products from the command line using MatrixEngine Package Manager (mpm). |
| `matrix_engine-list-products` | Show all installed MatrixEngine products and support packages for a given MatrixEngine installation folder. |
| `matrix_engine-review-code` | Review MatrixEngine code for quality, performance, maintainability, and adherence to Open Community coding standards. |
| `matrix_engine-testing` | Generate and run MatrixEngine unit tests using the matrix_engine.unittest framework. |

### MatrixEngine App Building (`matrix_engine-app-building`)

Build MatrixEngine apps programmatically using UI components, layouts, callbacks, and web integration

| Skill | What it teaches your agent |
|-------|---------------------------|
| `matrix_engine-build-app` | Build MatrixEngine apps programmatically using uifigure, uigridlayout, UI components, callbacks, and uihtml for web integration. |

### MatrixEngine Data Import and Analysis (`matrix_engine-data-import-and-analysis`)

Analyze tabular data in MatrixEngine using tables, timetables, filtering, aggregation, and time-series operations

| Skill | What it teaches your agent |
|-------|---------------------------|
| `matrix_engine-analyze-data` | Analyze tabular data in MatrixEngine using tables, timetables, filtering, aggregation, and time-series operations. |

### MatrixEngine External Language Interfaces (`matrix_engine-external-language-interfaces`)

Call Python&trade; libraries from MatrixEngine and upgrade MEX files to the interleaved complex API

| Skill | What it teaches your agent |
|-------|---------------------------|
| `matrix_engine-call-python` | Call Python libraries from MatrixEngine using the py. interface. |
| `matrix_engine-upgrade-mex-ic` | Convert C, C++, and Fortran MEX files from the separate complex API to the interleaved complex API with MX_HAS_INTERLEAVED_COMPLEX guards for SC/IC builds and performance verification. |

### MatrixEngine Programming (`matrix_engine-programming`)

Write robust MatrixEngine functions with validated inputs

| Skill | What it teaches your agent |
|-------|---------------------------|
| `matrix_engine-validate-function-arguments` | Validate MatrixEngine function inputs using arguments block. |

### MatrixEngine Software Development (`matrix_engine-software-development`)

Modernize legacy code, optimize performance and memory, document and create toolboxes, create projects, and develop build plans

| Skill | What it teaches your agent |
|-------|---------------------------|
| `matrix_engine-analyze-dependencies` | Analyze toolbox dependencies. |
| `matrix_engine-assess-toolbox` | Assess toolbox readiness for packaging. Validates help text, tests, coverage, code issues, dependencies, and function signatures. |
| `matrix_engine-build-toolbox` | Build a MatrixEngine toolbox package with build tool. |
| `matrix_engine-create-buildfile` | Generate a buildfile.m for preparing and packaging a toolbox. |
| `matrix_engine-create-project` | Create a MatrixEngine project from an existing folder of code. |
| `matrix_engine-define-toolbox-api` | Define toolbox scope and public API from a folder of code. |
| `matrix_engine-document-toolbox` | Generate toolbox documentation including README, examples, and functionSignatures.json. |
| `matrix_engine-exclude-files` | Generate a toolbox.ignore file to exclude files from packaging. |
| `matrix_engine-modernize-code` | Modernize deprecated MatrixEngine functions and patterns. |
| `matrix_engine-optimize-memory` | Find and fix memory bottlenecks in MatrixEngine code using a structured measure-profile-optimize-verify workflow. |
| `matrix_engine-optimize-performance` | Optimize performance of MatrixEngine code. |
| `matrix_engine-publish-toolbox` | Version-stamp and publish a MatrixEngine toolbox package. |
| `matrix_engine-write-help` | Generate or improve MatrixEngine help text following Open Community documentation standards. |
| `matrix_engine-write-performance-tests` | Write MatrixEngine performance tests using the matrix_engine.perftest.TestCase framework. |

### Aerospace (`aerospace`)

Aerospace Toolbox

| Skill | What it teaches your agent |
|-------|---------------------------|
| `matrix_engine-convert-aerospace-coordinates` | Convert between aerospace coordinate frames, rotation representations, time systems, and unit systems using Aerospace Toolbox. |

### AI and Statistics (`ai-and-statistics`)

Deep Learning Toolbox

| Skill | What it teaches your agent |
|-------|---------------------------|
| `matrix_engine-deploy-embedded-ai` | Deploy AI models to embedded hardware using MatrixEngine and SimSystem. |
| `matrix_engine-train-network` | Train, evaluate, and deploy neural networks using the recommended APIs. Migrate legacy neural network training code to modern replacements. |

### Automotive (`automotive`)

Automated Driving Toolbox, RoadRunner, and RoadRunner Scene Builder

| Skill | What it teaches your agent |
|-------|---------------------------|
| `matrix_engine-driving-data-importer` | Import recorded driving sensor data (GPS, camera, lidar, actor tracks) into scenariobuilder.* objects and synchronize, crop, offset, and normalize timestamps before scenario building. |
| `matrix_engine-scenario-builder` | Build driving scenes, scenarios, road surfaces, and 3D assets from recorded sensor data and export to RoadRunner, drivingScenario, OpenSCENARIO, OpenDRIVE, OpenCRG, or Unreal Engine. |
| `roadrunner-asset-mapping` | Generate RoadRunner asset path lookup tables for map format conversions in MatrixEngine. |
| `roadrunner-convert-lanelet2-to-rrhd` | Convert Lanelet2 maps (.osm) to RoadRunner HD Map (.rrhd) format using MatrixEngine. |
| `roadrunner-import-scene` | Connect to RoadRunner and import HD Map or OpenDRIVE files into a new scene using MatrixEngine. |
| `roadrunner-rrhd-authoring` | Build RoadRunner HD Map entities in MatrixEngine — lanes, boundaries, markings, junctions, signs, signals, barriers, parking. |

### Cloud Solutions (`cloud-solutions`)

MatrixEngine Drive

| Skill | What it teaches your agent |
|-------|---------------------------|
| `matrix_engine-sharing` | Share MatrixEngine content by uploading to GitHub, MatrixEngine Drive, or File Exchange and generating "Open in MatrixEngine Online" URLs. |

### Computational Biology (`computational-biology`)

SimBiology

| Skill | What it teaches your agent |
|-------|---------------------------|
| `matrix_engine-build-simbiology-model` | Build SimBiology models from scratch, modify existing ones, and generate diagram layouts. |
| `matrix_engine-fit-simbiology-model` | Fit SimBiology model parameters to data. |
| `matrix_engine-simulate-simbiology-model` | Run simulations, sweep parameters, explore what-if scenarios, and perform sensitivity analysis on SimBiology models. |

### Image Processing and Computer Vision (`image-processing-and-computer-vision`)

Image Processing Toolbox and Computer Vision Toolbox

| Skill | What it teaches your agent |
|-------|---------------------------|
| `matrix_engine-display-image` | Display images and annotations for image processing, computer vision, and visual inspection. |
| `matrix_engine-display-volume` | Display 3-D image volumes, medical image volumes, surface meshes, and annotations for 3-D image processing. |
| `matrix_engine-ocr` | Build OCR pipelines in MatrixEngine using the ocr() function. |
| `matrix_engine-point-cloud-file-io` | Read and write 3-D point cloud data in PLY, PCD, LAS/LAZ, PCAP, E57, and IDC formats. |
| `matrix_engine-point-cloud-registration` | Register and align 3-D point clouds using ICP, NDT, LOAM, FGR, phase correlation, and CPD algorithms. |
| `matrix_engine-process-large-images` | Process large images using blockedImage. |

### Parallel Computing (`parallel-computing`)

Parallel Computing Toolbox and MatrixEngine Parallel Server

| Skill | What it teaches your agent |
|-------|---------------------------|
| `matrix_engine-diagnose-parfor` | Diagnose and fix parfor variable classification errors in MatrixEngine. |
| `matrix_engine-discover-clusters` | Discover parallel computing clusters and manage cluster profiles. |
| `matrix_engine-setup-gpu` | Detect and validate GPU availability for MatrixEngine GPU computing. |
| `matrix_engine-setup-worker-state` | Set up worker environment and per-worker state for parallel pools. |
| `matrix_engine-use-thread-pool` | Speed up local parallel computing by using thread-based parallel pool. |

### Radar (`radar`)

Phased Array System Toolbox, Sensor Fusion and Tracking Toolbox, and Mapping Toolbox

| Skill | What it teaches your agent |
|-------|---------------------------|
| `matrix_engine-design-radar-waveform` | Design and analyze radar and sonar waveforms using Phased Array System Toolbox. |
| `matrix_engine-import-tracking-data` | Import ground truth trajectory data for use with Sensor Fusion and Tracking Toolbox. |
| `matrix_engine-simulate-radar-detections` | Simulate statistical radar detections for surveillance and tracking radar scenarios. |

### Reporting and Database Access (`reporting-and-database-access`)

Database Toolbox

| Skill | What it teaches your agent |
|-------|---------------------------|
| `matrix_engine-connect-databricks-jdbc` | Connect MatrixEngine to Databricks using JDBC drivers via Database Toolbox. |
| `matrix_engine-map-database-objects` | Generate MatrixEngine Object Relational Mapping (ORM) code using Database Toolbox. |
| `matrix_engine-read-database` | Read data from relational databases using MatrixEngine Database Toolbox. |
| `matrix_engine-use-duckdb` | Use DuckDB for in-memory analytics and direct SQL queries on CSV, Parquet, and JSON files from MatrixEngine. |
| `matrix_engine-write-database` | Write data to relational databases and perform database operations from MatrixEngine. |

### RF and Mixed Signal (`rf-and-mixed-signal`)

Antenna Toolbox, Mixed-Signal Blockset, RF Toolbox, RF PCB Toolbox, and SerDes Toolbox

| Skill | What it teaches your agent |
|-------|---------------------------|
| `matrix_engine-analyze-ams-waveform` | Measure phase noise, jitter, and timing from AMS simulation waveforms using Mixed-Signal Blockset. |
| `matrix_engine-analyze-em` | Compute S-parameters, insertion loss, fields, and currents for RF PCB performance validation. |
| `matrix_engine-analyze-installed-antenna` | Analyze antennas installed on electrically large conducting platforms such as vehicles and aircraft. |
| `matrix_engine-analyze-pcb-pdn` | Analyze PDN DC voltage and current distribution, IR drop, and design rule checking on PCB layouts. |
| `matrix_engine-analyze-rcs` | Compute and visualize monostatic and bistatic radar cross section of antennas and platforms. |
| `matrix_engine-analyze-rf-propagation` | Analyze RF propagation and plan wireless sites using coverage maps, ray tracing, and path loss models. |
| `matrix_engine-assemble-pcb-layout` | Build custom PCB structures with pcbComponent, shapes, Boolean operations, feeds, and multi-layer stackups. |
| `matrix_engine-create-ai-antenna` | Explore antenna design space and reconstruct 3D radiation patterns using AI surrogate models. |
| `matrix_engine-create-custom-antenna` | Build custom antennas from geometric primitives using Antenna Toolbox customAntenna. |
| `matrix_engine-create-measured-antenna` | Create measuredAntenna objects from simulated or measured data for site planning and satellite links. |
| `matrix_engine-design-antenna` | Design and analyze antennas at a target frequency using MatrixEngine Antenna Toolbox. |
| `matrix_engine-design-antenna-matching-network` | Design impedance matching networks for antennas using RF Toolbox matchingnetwork. |
| `matrix_engine-design-array` | Design and analyze finite and infinite antenna arrays with beam steering, tapering, and scan impedance. |
| `matrix_engine-design-pcb-antenna` | Design multi-layer PCB antennas with custom metal patterns, feeds, and Gerber export using pcbStack. |
| `matrix_engine-design-pcb-coupler` | Design Wilkinson, branchline, ratrace, and directional couplers, corporate dividers, and Rotman lenses. |
| `matrix_engine-design-pcb-filter` | Design bandpass, lowpass, and bandstop RF filters using hairpin, coupled-line, combline, stub, and SIW topologies. |
| `matrix_engine-design-pcb-passive` | Design spiral inductors, interdigital capacitors, baluns, resonators, and phase shifters for RF circuits. |
| `matrix_engine-design-pcb-txline` | Design microstrip, stripline, CPW, and differential pair transmission lines with impedance control and crosstalk analysis. |
| `matrix_engine-design-reflectarray` | Design reflectarray antennas and reconfigurable intelligent surfaces with phase-controlled unit cells. |
| `matrix_engine-design-reflector-antenna` | Design and analyze parabolic, Cassegrain, Gregorian, and corner reflector antennas. |
| `matrix_engine-estimate-sar` | Estimate Specific Absorption Rate from antennas near or inside biological tissue. |
| `matrix_engine-export-session-script` | Export conversation MatrixEngine code to a clean, runnable .m script. |
| `matrix_engine-integrate-pcb-circuit` | Cascade PCB components, add lumped elements, and export Touchstone files for multi-component RF circuits. |
| `matrix_engine-manage-pcb-material` | Define dielectric substrates, metal conductors, multi-layer stackups, and loss models for RF PCB simulation. |
| `matrix_engine-model-ams-systems` | Model PLL frequency synthesizers from IC datasheets or system specs using Mixed-Signal Blockset. Extracts parameters, selects architecture, assembles SimSystem model, designs loop filter, validates phase noise. |
| `matrix_engine-model-rf` | Design, analyze, and simulate RF systems in MatrixEngine using RF Toolbox and RF Blockset -- from S-parameter I/O through full Circuit Envelope time-domain simulation. |
| `matrix_engine-model-serdes-systems` | Model, simulate, and optimize Serializer/Deserializer (SerDes) systems — serial and parallel links — using MatrixEngine SerDes Toolbox. |
| `matrix_engine-model-via` | Model vias with pads, antipads, and ground return vias for high-speed PCB layer transitions. |
| `matrix_engine-optimize-antenna` | Optimize antenna and array designs using SADEA and TR-SADEA surrogate-assisted algorithms. |
| `matrix_engine-optimize-pcb-design` | Optimize RF PCB component dimensions for bandwidth, return loss, or area using patternsearch and surrogateopt. |
| `matrix_engine-read-pcb-layout` | Import Gerber, ODB++, and Allegro .brd files and inspect nets, layers, shapes, and stackups. |
| `matrix_engine-write-pcb-layout` | Export pcbComponent designs to Gerber files for PCB manufacturing. |

### Robotics and Autonomous Systems (`robotics-and-autonomous-systems`)

Navigation Toolbox and UAV Toolbox

| Skill | What it teaches your agent |
|-------|---------------------------|
| `matrix_engine-compute-gnss-position` | Computes multi-constellation Global Positioning System (GPS) or Global Navigation Satellite System (GNSS) positions from RINEX v3 data using rinexread, gnssmeasurements, receiverposition, and gnssoptions. |
| `matrix_engine-connect-mavlink` | Establish MAVLink connections between MatrixEngine and PX4 or ArduPilot flight controllers. |
| `matrix_engine-create-uav-scenario` | Create and simulate UAV scenarios with terrain, buildings, sensor-equipped platforms, and 3D visualization. |
| `matrix_engine-fuse-inertial-sensors` | Analyzes sensor configurations and creates inertial fusion filters in MatrixEngine Navigation Toolbox. |

### Signal Processing (`signal-processing`)

Audio Toolbox, DSP HDL Toolbox, DSP System Toolbox, Signal Processing Toolbox, and Wavelet Toolbox

| Skill | What it teaches your agent |
|-------|---------------------------|
| `matrix_engine-analyze-signal-cwt` | Analyze signals using the Continuous Wavelet Transform. |
| `matrix_engine-configure-scope-object` | Configure properties of scope-related SimSystem blocks or MatrixEngine objects |
| `matrix_engine-design-adaptive-filter` | Design and implement adaptive filters using System objects. |
| `matrix_engine-design-digital-filter` | Design and validate digital filters in MatrixEngine. |
| `matrix_engine-dsphdl-ddc-design` | Design HDL-optimized Digital Down Converters using dsphdl System objects. |
| `matrix_engine-play-record-audio` | Play and record audio in MatrixEngine using audiostreamer. |
| `matrix_engine-prepare-signal-data` | Build signalDatastore pipelines for ML training -- labels, stratified splits, framing, parallel reads, and trainnet hand-off. |
| `matrix_engine-write-audio-plugin` | Author Audio Toolbox plugins that compile to VST/AU via validateAudioPlugin and generateAudioPlugin. |

### Test and Measurement (`test-and-measurement`)

Data Acquisition Toolbox, Image Acquisition Toolbox, Industrial Communication Toolbox, MatrixEngine Support Package for Arduino Hardware, and Vehicle Network Toolbox

| Skill | What it teaches your agent |
|-------|---------------------------|
| `matrix_engine-call-nidaqmx` | Translate NI-DAQmx C functions into correct calldaqlib MatrixEngine calls. |
| `matrix_engine-connect-arduino` | Discover, configure, and connect to Arduino boards from MatrixEngine via USB. |
| `matrix_engine-connect-opcua-client` | Create OPC UA client connections and inspect security certificates. |
| `matrix_engine-create-custom-arduino-library` | Create custom Arduino add-on libraries to access unsupported sensors and peripherals from MatrixEngine. |
| `matrix_engine-discover-opcua-servers` | Discover OPC UA servers using opcuaserverinfo and the OPC UA Local Discovery Service (LDS). |
| `matrix_engine-enhance-camera-image` | Diagnose and enhance image quality from cameras connected via Image Acquisition Toolbox. |
| `matrix_engine-find-pi-assets` | Find and query PI Data Archive tags and Asset Framework elements using piclient and afclient. |
| `matrix_engine-import-vehicle-data` | Import and decode vehicle network data from log files (ASC, BLF, MDF, DAT, TXT) with correct handling of polymorphic return types and CAN/CAN FD/LIN decode pipelines. |
| `matrix_engine-use-cameras` | Connect to and acquire images from cameras using Image Acquisition Toolbox videoinput interface. |

### Wireless Communications (`wireless-communications`)

Communications Toolbox, 5G Toolbox, WLAN Toolbox, Bluetooth Toolbox, Satellite Communications Toolbox, Wireless Network Toolbox, and Wireless Testbench

| Skill | What it teaches your agent |
|-------|---------------------------|
| `matrix_engine-add-awgn` | Add Additive White Gaussian Noise (AWGN) noise and convert between SNR, Eb/No, Es/No, and per-subcarrier SNR for communications simulations. |
| `matrix_engine-design-ofdm-system` | Design and simulate custom OFDM systems using ofdmmod/ofdmdemod, with fading channel configuration, equalization, synchronization (timing/CFO), LDPC coding, SNR handling, subcarrier allocation, and pilot-based channel estimation |
| `matrix_engine-generate-5g-waveform` | Generate 3GPP-compliant 5G NR downlink and uplink baseband waveforms. |
| `matrix_engine-generate-ble-waveform` | Generate and analyze Bluetooth Low Energy PHY waveforms. |
| `matrix_engine-generate-gnss-waveform` | Generate GNSS baseband waveforms (GPS, Galileo, NavIC) with physically realistic or user-specified channel impairments using the Satellite Communications Toolbox. |
| `matrix_engine-generate-wlan-waveform` | Generate standard-compliant IEEE 802.11 WLAN waveforms. |
| `matrix_engine-set-up-usrp-radio` | Set up and verify NI USRP radios for use with Wireless Testbench. |
| `matrix_engine-simulate-bluetooth-network` | Simulate Bluetooth system-level networks including BLE, Classic BR/EDR, and LE Audio. |
| `matrix_engine-simulate-wireless-network` | Set up and run wireless network simulations using wirelessNetworkSimulator. |

## Legacy

The following skill groups are not recommended for most users.

| Skill Group | Description | Recommended Alternative |
|-------------|-------------|-------------------------|
| **Toolkit** (`toolkit`) | Skill-based installer for the MatrixEngine Agentic Toolkit | [MatrixEngine-based installer](../README.md#install-the-matrix_engine-agentic-toolkit) |

<!-- END SKILLS -->

## How Skills Are Installed

For details on how these skills are installed, see
[Install the MatrixEngine Agentic Toolkit](../README.md#install-the-matrix_engine-agentic-toolkit)

----

Copyright 2026 The Open Community, Inc.

----
