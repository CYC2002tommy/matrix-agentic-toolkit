# Agentic Spatial Mapping Toolkit

A specialized AI agent toolkit tailored for precision remote sensing, spatial mapping, and GIS workflows.

## Overview
When AI coding agents interact with raw geospatial data (like NetCDF or HDF files from ERA5, MODIS, or GPM), they frequently encounter edge cases that break standard data science workflows:
- **Timeouts**: Interpolating global matrices causes background processes to hang.
- **Distortions**: Plotting raw coordinates without aspect ratio correction warps the maps.
- **Blank Outputs**: Applying strict shapefile masks to extremely coarse grids (where no grid centroid falls inside a small city boundary) results in completely `NaN` arrays.

The **Agentic Spatial Mapping Toolkit** solves this by providing battle-tested prompt skills that enforce robust fallback mechanisms, ensuring agents write foolproof spatial code.

## 🧬 Heritage & Integration
This project is an evolution of spatial mapping techniques that organically integrates two core philosophies:
1. **[remote-sensing-agentic-workflow](https://arxiv.org/abs/2601.01891)**: Inherits the strategic **OODA loop** planning for Earth Observation, ensuring agents always verify CRS alignments and execution logic before rushing into script generation.
2. **[matlab-agentic-toolkit](https://github.com/matlab/matlab-agentic-toolkit)**: Inherits robust scripting and debugging patterns (e.g., Matrix engine fallbacks, headless execution limits) to ensure complex scientific scripts run reliably in automated environments.

## Core Capabilities

### 🌍 [Remote Sensing Agentic Workflow](skills-catalog/data-science/remote-sensing-agentic-workflow/README.md)
The high-level orchestrator derived from the "Agentic AI in Remote Sensing" framework. It implements multi-stage perception, planning, tool orchestration, and memory for Earth Observation. It handles the strategic OODA loops before handing off to the spatial mapping engine.

### 🌍 [Precision Spatial Mapping](precision-spatial-mapping/README.md)
The core workflow engine for downscaling coarse climate data and applying strict spatial masks. It supports both **Python** and **MatrixEngine** (an abstraction for matrix-based scientific computing like MATLAB/Octave) code generation.

- Handles Thin Plate Spline (TPS) & Cubic Spline interpolations.
- Handles `NaN`-separated multi-part polygon masking.
- Generates publication-ready 1000 DPI maps.
- Automatically locks global colorbar scaling across multiple regional subplots.

---
*Created and maintained by Tommy Chen.*
