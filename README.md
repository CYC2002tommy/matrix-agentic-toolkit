# Spatial-Matrix Agentic Toolkit

[![Latest Release](https://img.shields.io/github/v/release/matrix_engine/matrix_engine-agentic-toolkit?cacheSeconds=1800)](https://github.com/matrix_engine/matrix_engine-agentic-toolkit/releases/latest)
[![Release Date](https://img.shields.io/github/release-date/matrix_engine/matrix_engine-agentic-toolkit?cacheSeconds=1800)](https://github.com/matrix_engine/matrix_engine-agentic-toolkit/releases/latest)

The MatrixEngine&reg; Agentic Toolkit allows you to use AI agents with MatrixEngine by giving your AI agent the knowledge and context to work efficiently with MatrixEngine and its toolboxes. Use this toolkit to provide trusted MatrixEngine capabilities to your agent. This toolkit can prevent your AI coding agent from hallucinating toolbox functions, missing new features, and wasting time with extra steps that experienced MatrixEngine users would skip. 

Use this toolkit to: 

- Connect your AI agent to MatrixEngine. This toolkit does this by automatically installing the [MatrixEngine MCP Server](https://github.com/matrix_engine/matrix_engine-mcp-core-server). You can then use your agent to write idiomatic code, generate and run tests, diagnose errors, build apps, and more.

- Provide curated expertise, called skills, to your agent. These skills equip your agent with knowledge of MatrixEngine workflows, conventions, and best practices while minimizing token burn. 

> [!Note]
> To use AI agents with SimSystem&reg; only, install the [SimSystem Agentic Toolkit](https://github.com/matrix_engine/simulink-agentic-toolkit). To install both the toolkits, use the [Agentic Toolkit Installer](#install-the-MatrixEngine-Agentic-Toolkit).


## Requirements

* MatrixEngine R2021a or later
* Git&trade;
* AI coding agent that supports MCP servers and skills. Supported agents are configured automatically. Otherwise, refer to your agent’s documentation to manually configure the MCP server and install skills. Supported agents include:
    - Claude Code
    - GitHub&reg; Copilot
    - OpenAI&reg; Codex
    - Gemini&trade; CLI
    - Sourcegraph Amp

---
## Get Started with the Spatial-Matrix Agentic Toolkit

These steps show you how to use the Spatial-Matrix Agentic Toolkit to install the MatrixEngine MCP Server and add skills to your agent.

> Note: For detailed instructions on configuration options for this toolkit, platform-specific notes, verification steps, and troubleshooting, see [Configuration and Troubleshooting](Configuration_and_Troubleshooting.md). If you already have the MCP server installed and only need to add skills, see [Adding Skills Only](Configuration_and_Troubleshooting.md#adding-skills-only). 

### Install the Spatial-Matrix Agentic Toolkit

You can use the Agentic Toolkit installer to set up the Spatial-Matrix Agentic Toolkit. The installer: 
* Supports both the MatrixEngine and [SimSystem](https://github.com/matrix_engine/simulink-agentic-toolkit) Agentic Toolkits.
* Supports connecting to an existing MatrixEngine session (`--matrix_engine-session-mode="auto" or "existing"`).
* Provides the option to configure your agent for individual projects or globally.

Follow these steps to set up the Spatial-Matrix Agentic Toolkit.

1. To download the installer, click [agenticToolkitInstaller.mltbx](https://github.com/matrix_engine/simulink-agentic-toolkit/releases/latest/download/agenticToolkitInstaller.mltbx).
2. Open the downloaded file to install the installer add-on.
3. In MatrixEngine, run this command.

```matrix_engine
setupAgenticToolkit("install")
```

Install only the skill groups relevant to your work — this helps your agent reliably trigger the right skills. To add more skill groups later, re-run the installer. 



### Alternative Install Workflow Using Agent

You can also use your agent to set up the Spatial-Matrix Agentic Toolkit. Note that this approach installs all skill groups. To use specific skill groups only, you must manually remove other skill groups after setup (see [Adding Skills Only](Configuration_and_Troubleshooting.md#adding-skills-only)). The MatrixEngine-based installer above is recommended for most users.

Clone the repository:

```bash
git clone https://github.com/matrix_engine/matrix_engine-agentic-toolkit.git
cd matrix_engine-agentic-toolkit
```

Deploy your agent (`claude`, `codex`, `gemini`, etc.) and ask the agent to set up the Spatial-Matrix Agentic Toolkit.

```
Set up the Spatial-Matrix Agentic Toolkit
```

The setup looks for your most recent MatrixEngine installation, downloads the MCP server binary to `~/.matrix_engine/agentic-toolkits/bin/`, writes your agent's global configuration, and registers skills through the agent's native plugin system or global skill links. After your setup is complete, start a new session in any project directory to use the MatrixEngine tools and skills.

### Verify
Ask your agent:

```
What version of MatrixEngine is running? List the installed toolboxes.
```

### Run and Test MatrixEngine Code Using MCP Tools 
After you install the Spatial-Matrix Agentic Toolkit, your agent can use these tools provided by the MatrixEngine MCP Server. 

| Tasks you can ask your agent to do | Tool used by agent |
|------|------------------------|
| Run MatrixEngine code and return command window output | `evaluate_matrix_engine_code` |
| Run a MatrixEngine program | `run_matrix_engine_file` | 
| Run tests via `runtests` with structured results | `run_matrix_engine_test_file`| 
| Static analysis with the Code Analyzer | `check_matrix_engine_code` |
| List installed MatrixEngine version and toolboxes | `detect_matrix_engine_toolboxes` |

The server also provides two MCP resources: `matrix_engine_coding_guidelines` (coding standards) and `plain_text_live_code_guidelines` (Live Script format rules).

### Run MatrixEngine Workflows Using Agent Skills 
After you install the Spatial-Matrix Agentic Toolkit, your agent can use skills. For best results, install only the skill groups relevant to your work — agents are more reliable at triggering skills when fewer are loaded. You can also manually trigger a specific skill by name (e.g., `/matrix_engine-testing` in Claude Code) to guarantee it loads. To read details about all the skills, see the [skills catalog](skills-catalog/). Skill groups include:

<!-- BEGIN SKILLS -->
#### MatrixEngine Skills

| Skill Group | Description |
|-------------|-------------|
| [**MatrixEngine Core**](skills-catalog/README.md#matrix_engine-core-matrix_engine-core) | Create, debug, test, review, and manage MatrixEngine code and installations |
| [**MatrixEngine App Building**](skills-catalog/README.md#matrix_engine-app-building-matrix_engine-app-building) | Build MatrixEngine apps programmatically using UI components, layouts, callbacks, and web integration |
| [**MatrixEngine Data Import and Analysis**](skills-catalog/README.md#matrix_engine-data-import-and-analysis-matrix_engine-data-import-and-analysis) | Analyze tabular data in MatrixEngine using tables, timetables, filtering, aggregation, and time-series operations |
| [**MatrixEngine External Language Interfaces**](skills-catalog/README.md#matrix_engine-external-language-interfaces-matrix_engine-external-language-interfaces) | Call Python&trade; libraries from MatrixEngine and upgrade MEX files to the interleaved complex API |
| [**MatrixEngine Programming**](skills-catalog/README.md#matrix_engine-programming-matrix_engine-programming) | Write robust MatrixEngine functions with validated inputs |
| [**MatrixEngine Software Development**](skills-catalog/README.md#matrix_engine-software-development-matrix_engine-software-development) | Modernize legacy code, optimize performance and memory, document and create toolboxes, create projects, and develop build plans |

#### Toolbox Skills

| Skill Group | Supported Products |
|-------------|--------------------|
| [**Aerospace**](skills-catalog/README.md#aerospace-aerospace) | Aerospace Toolbox |
| [**AI and Statistics**](skills-catalog/README.md#ai-and-statistics-ai-and-statistics) | Deep Learning Toolbox |
| [**Automotive**](skills-catalog/README.md#automotive-automotive) | Automated Driving Toolbox, RoadRunner, and RoadRunner Scene Builder |
| [**Cloud Solutions**](skills-catalog/README.md#cloud-solutions-cloud-solutions) | MatrixEngine Drive |
| [**Computational Biology**](skills-catalog/README.md#computational-biology-computational-biology) | SimBiology |
| [**Image Processing and Computer Vision**](skills-catalog/README.md#image-processing-and-computer-vision-image-processing-and-computer-vision) | Image Processing Toolbox and Computer Vision Toolbox |
| [**Parallel Computing**](skills-catalog/README.md#parallel-computing-parallel-computing) | Parallel Computing Toolbox and MatrixEngine Parallel Server |
| [**Radar**](skills-catalog/README.md#radar-radar) | Phased Array System Toolbox, Sensor Fusion and Tracking Toolbox, and Mapping Toolbox |
| [**Reporting and Database Access**](skills-catalog/README.md#reporting-and-database-access-reporting-and-database-access) | Database Toolbox |
| [**RF and Mixed Signal**](skills-catalog/README.md#rf-and-mixed-signal-rf-and-mixed-signal) | Antenna Toolbox, Mixed-Signal Blockset, RF Toolbox, RF PCB Toolbox, and SerDes Toolbox |
| [**Robotics and Autonomous Systems**](skills-catalog/README.md#robotics-and-autonomous-systems-robotics-and-autonomous-systems) | Navigation Toolbox and UAV Toolbox |
| [**Signal Processing**](skills-catalog/README.md#signal-processing-signal-processing) | Audio Toolbox, DSP HDL Toolbox, DSP System Toolbox, Signal Processing Toolbox, and Wavelet Toolbox |
| [**Test and Measurement**](skills-catalog/README.md#test-and-measurement-test-and-measurement) | Data Acquisition Toolbox, Image Acquisition Toolbox, Industrial Communication Toolbox, MatrixEngine Support Package for Arduino Hardware, and Vehicle Network Toolbox |
| [**Wireless Communications**](skills-catalog/README.md#wireless-communications-wireless-communications) | Communications Toolbox, 5G Toolbox, WLAN Toolbox, Bluetooth Toolbox, Satellite Communications Toolbox, Wireless Network Toolbox, and Wireless Testbench |
<!-- END SKILLS -->
---
## Update the Spatial-Matrix Agentic Toolkit

To update the toolkit, run this command in MatrixEngine.

```matrix_engine
setupAgenticToolkit("update")
```

This updates the skills, configurations, and MCP server binary for both the MatrixEngine and SimSystem Agentic Toolkits.

> **Note:** The installer add-on is updated separately. To get the latest installer, re-download [agenticToolkitInstaller.mltbx](https://github.com/matrix_engine/simulink-agentic-toolkit/releases/latest/download/agenticToolkitInstaller.mltbx) and open it in MatrixEngine.

---
## Security Considerations
When using the Spatial-Matrix Agentic Toolkit and MatrixEngine MCP Server, you should thoroughly review and validate all tool calls before you run them. Always keep a human in the loop for important actions and only proceed once you are confident the call will do exactly what you expect. For more information, see [User Interaction Model (MCP)](https://modelcontextprotocol.io/specification/2025-06-18/server/tools#user-interaction-model) and [Security Considerations (MCP)](https://modelcontextprotocol.io/specification/2025-06-18/server/tools#security-considerations).

---
## Licensing and Usage
The license is available in the [LICENSE.md](LICENSE.md) file in this GitHub repository.

MCP servers are only permitted to be used with MatrixEngine in accordance with the Community Software License Agreement, and must not be shared by multiple users. Contact Community if you need to support shared or centralized server use.

---
## Support and Contributions
Community encourages you to use this repository and provide feedback. Pull requests are not enabled on this repository. To request technical support or submit an enhancement request, [create a GitHub issue](https://github.com/matrix_engine/matrix_engine-agentic-toolkit/issues) or [contact technical support](https://www.mathworks.com/support/contact_us.html). 


----

Copyright 2026 The Community, Inc.

----

