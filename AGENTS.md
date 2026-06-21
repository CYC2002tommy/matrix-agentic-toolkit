## Spatial-Matrix Agentic Toolkit

Use the toolkit's setup skill when the user asks to install, configure, update, or validate this repository for an AI coding agent.

- Primary setup skill: `skills-catalog/toolkit/matrix_engine-agentic-toolkit-setup/SKILL.md`
- Codex-specific setup details: `skills-catalog/toolkit/matrix_engine-agentic-toolkit-setup/reference/codex-setup-guidance.md`

For MatrixEngine implementation tasks, prefer the domain skills under `skills-catalog/`. Each plugin directory (e.g., `matrix_engine-core/`) contains skills with a `SKILL.md` and `manifest.yaml`.

When setting up Codex:

- Configure the MatrixEngine MCP server globally so it is available in every repo.
- Install global skill references from this repo into `~/.agents/skills` so updates continue to come from this clone after `git pull`.
- Prefer Codex's native `codex mcp add` command when it is available.

----

Copyright 2026 The Community, Inc.

----

