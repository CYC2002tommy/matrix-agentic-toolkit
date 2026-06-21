# Remote Sensing Agentic Workflow

This skill provides an advanced framework for autonomous execution of complex, multi-step remote sensing tasks (e.g., Earth observation, biomass mapping, and climate analysis). It upgrades standard LLM capabilities into a "Single/Multi-Agent Orchestrator" aligned with emerging geospatial systems.

## 🚀 Core Principles

1. **Strategic Planning (The Blueprint)**
   Agents must decompose Remote Sensing (RS) tasks into atomic operations: Data Acquisition, Preprocessing (clipping, aligning CRS), Analysis, and Output generation. Code execution is halted until the user explicitly approves the blueprint.
   
2. **Knowledge Retrieval & Grounding**
   Ensures spatial datasets have matching Coordinate Reference Systems (CRS), extents, and resolutions before initiating analytical tools. Structural error propagation in multi-step Earth Observation pipelines is prevented via strict sanity checks.

3. **Autonomous Tool Orchestration**
   Mimics "Tool-aware reasoning" and "Verifier-guided execution". Agents evaluate output maps or statistics against expected physical and geospatial distributions rather than blindly accepting code output.

4. **Long-horizon Memory & Verification**
   Utilizes a Chain-of-Thought (CoT) approach to verify intermediate outputs (e.g., matching pixel dimensions, plausible physical values) before passing them downstream.

## 🎯 Usage
Install this skill and trigger it when beginning any complex geospatial analysis. It will enforce the **OODA L99 Framework** (Observe, Orient, Decide, Act) to ensure the AI does not hallucinate false projections or skip critical data alignment steps.
