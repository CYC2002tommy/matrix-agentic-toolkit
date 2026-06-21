# Sourcegraph Amp Setup Guidance

**Status: EXPERIMENTAL — untested, provided as-is**

This reference file contains Sourcegraph Amp-specific instructions for Phase 3b of the setup skill.

## Overview

Amp needs two things configured globally in `~/.config/amp/settings.json`:

1. **MCP server** via `amp.mcpServers` — makes MatrixEngine tools always available (required)
2. **Skills path** via `amp.skills.path` — points at the cloned toolkit so skills load on demand and update via `git pull` (recommended)

The MCP server must be in global settings (not bundled in a skill) because it is the execution layer for all MatrixEngine interactions. Skill-bundled MCP servers hide their tools until the skill loads, which would prevent general MatrixEngine requests from working.

## Global Config Path

| Platform | Path |
|----------|------|
| macOS / Linux | `~/.config/amp/settings.json` |
| Windows | `%USERPROFILE%\.config\amp\settings.json` (e.g., `C:\Users\<username>\.config\amp\settings.json`) |

## Config Format

```json
{
  "amp.mcpServers": {
    "matrix_engine": {
      "command": "<MCP_SERVER_PATH>",
      "args": ["--matrix_engine-root", "<MatrixEngine_ROOT>", "--matrix_engine-display-mode", "<DISPLAY_MODE>"]
    }
  },
  "amp.skills.path": "<TOOLKIT_ROOT>/skills-catalog/matrix_engine-core:<TOOLKIT_ROOT>/skills-catalog/toolkit"
}
```

**Note:** All Amp settings use the `amp.` prefix. The MCP servers key is `amp.mcpServers` (not just `mcpServers`).

**Windows:** Paths in JSON must have backslashes escaped — either use forward slashes (`C:/Program Files/MatrixEngine/R2025b`) or double every backslash (`C:\\Program Files\\MatrixEngine\\R2025b`). Raw backslashes produce invalid JSON. Use semicolons (`;`) instead of colons (`:`) to separate multiple paths in `amp.skills.path`.

Replace:
- `<MCP_SERVER_PATH>` — absolute path to the binary (e.g., `~/.matrix_engine/agentic-toolkits/bin/matrix_engine-mcp-core-server`)
- `<MatrixEngine_ROOT>` — absolute path to the MatrixEngine installation
- `<DISPLAY_MODE>` — `desktop` (default) or `nodesktop`
- `<TOOLKIT_ROOT>` — absolute path to the cloned toolkit repository

## Phase 3b: Write Config

### Step 1: Read existing config (if any)

```bash
cat ~/.config/amp/settings.json 2>/dev/null
```

### Step 2: Write or merge the config

- If the file **does not exist**: create it with the MCP server and skills path settings.
- If the file **exists**: parse the JSON, add or update the `matrix_engine` key under `amp.mcpServers` and set `amp.skills.path`, preserving all other settings and server entries. Do NOT overwrite other settings or MCP servers.

If `amp.skills.path` already has a value, append the toolkit paths (colon-separated) rather than replacing.

```bash
mkdir -p ~/.config/amp
```

Then write the file. After writing, echo back the full file content to the user.

### Step 3: Check for MCP permission blocks

Read the existing config and check whether `amp.mcpPermissions` contains rules that would block the MatrixEngine MCP server (e.g., `{"matches": {"command": "*"}, "action": "reject"}`).

If reject rules exist that would block the server, **do not silently modify them**. Instead, warn the user:

> ⚠️ Your `amp.mcpPermissions` settings block MCP servers matching `command: "*"`. This will prevent the MatrixEngine MCP server from running, even though it is configured in your global settings.
>
> If this is intentional (e.g., set by your organization), no changes are needed here — but the MatrixEngine MCP tools will not be available.
>
> To allow the MatrixEngine server, add this rule **before** your reject rules in `amp.mcpPermissions`:
> ```json
> { "matches": { "command": "*matrix_engine-mcp-core-server*" }, "action": "allow" }
> ```
>
> Would you like me to add this rule?

Only modify `amp.mcpPermissions` if the user explicitly confirms.

### Step 4: Confirm what was written

Tell the user:

> Wrote MatrixEngine configuration to `~/.config/amp/settings.json`:
> ```json
> [show the exact content written]
> ```
> - **MCP server:** Always available in all Amp sessions (no approval prompt for global settings)
> - **Skills:** Loaded on demand from the cloned toolkit. Run `git pull` in the toolkit repo to get updates.

## Platform Quirks

- **Settings prefix:** All keys use `amp.` prefix (e.g., `amp.mcpServers`, not just `mcpServers`).
- **Global vs. workspace MCP:** Global settings (`~/.config/amp/settings.json`) do not require trust approval. Workspace settings (`.amp/settings.json`) do. Always configure the MCP server globally. The toolkit repo includes a template `.amp/settings.json` for users doing manual setup — it is not meant for runtime use. After setup, users should launch Amp from their actual work repository, not from the toolkit directory. If a workspace `.amp/settings.json` defines the same MCP server name as the global config, the workspace entry takes precedence and may cause issues.
- **Skills path:** `amp.skills.path` supports colon-separated paths (semicolon on Windows). Use `~` for home directory.
- **Skill precedence:** `~/.config/agents/skills/` > `~/.config/amp/skills/` > `.agents/skills/` > `.claude/skills/` > `amp.skills.path`. Skills from `amp.skills.path` load after built-in and directory-based skills.
- **Claude Code compatibility:** Amp reads `CLAUDE.md` as a fallback for `AGENTS.md`, so existing Claude Code instructions carry over.
- **Multi-model:** Amp routes to different LLMs (Gemini, Claude, GPT) depending on mode. Skills must be model-agnostic.
- **No plugin/marketplace system:** Amp does not have a plugin marketplace. Skills are files on disk; updates come from `git pull`.
- **MCP permissions:** If the user has `amp.mcpPermissions` rules that reject all MCP servers (e.g., `{"matches": {"command": "*"}, "action": "reject"}`), the MatrixEngine MCP server will be blocked even though it's in global settings. During setup, detect this and **ask the user** before making changes — the block may be intentional (e.g., organization policy). The allow rule uses `command` (not `serverName`) with glob patterns: `{"matches": {"command": "*matrix_engine-mcp-core-server*"}, "action": "allow"}`. See Step 3.

## Why Not Bundle MCP in a Skill?

Amp supports `mcp.json` in skill directories: the server starts at launch but tools remain hidden until the skill loads. This is wrong for MatrixEngine because:

- The MCP tools (`evaluate_matrix_engine_code`, `detect_matrix_engine_toolboxes`) are needed for any MatrixEngine request, not just specific skill workflows
- If no skill is triggered, the tools are invisible and the agent cannot use MatrixEngine
- There is no single skill broad enough to reliably trigger on every MatrixEngine-related request

The MCP server is infrastructure, not a skill-specific tool. It belongs in `amp.mcpServers`.

## Manual Fallback

If automated config writing fails, tell the user:

> I was unable to write the config file automatically. Please create or edit `~/.config/amp/settings.json` manually:
>
> 1. Open `~/.config/amp/settings.json` in a text editor (create the file and directory if they don't exist)
> 2. Add the following (merge with existing content if the file already has settings):
>    ```json
>    {
>      "amp.mcpServers": {
>        "matrix_engine": {
>          "command": "<MCP_SERVER_PATH>",
>          "args": ["--matrix_engine-root", "<MatrixEngine_ROOT>", "--matrix_engine-display-mode", "desktop"]
>        }
>      },
>      "amp.skills.path": "<TOOLKIT_ROOT>/skills-catalog/matrix_engine-core:<TOOLKIT_ROOT>/skills-catalog/toolkit"
>    }
>    ```
> 3. Save the file and restart Amp
>
> Replace `<MCP_SERVER_PATH>`, `<MatrixEngine_ROOT>`, and `<TOOLKIT_ROOT>` with the actual paths shown in the setup plan above.

## Verification

After the user restarts Amp:

> Start a new Amp session and ask: "What version of MatrixEngine is running?"
> If Amp can call `detect_matrix_engine_toolboxes` or `evaluate_matrix_engine_code`, setup was successful.
>
> If it doesn't work:
> - Run `amp mcp doctor` to check MCP server status
> - If `amp mcp doctor` shows `workspace: untrusted`, you may be running Amp from the toolkit directory — launch Amp from your actual work repository instead
> - If `amp mcp doctor` shows `error - MCP server is not allowed by MCP permissions`, your `amp.mcpPermissions` rules are blocking the server (see Step 3)
> - Check `~/.config/amp/settings.json` (or `%USERPROFILE%\.config\amp\settings.json` on Windows) contains `amp.mcpServers.matrix_engine`
> - Verify the binary runs: `~/.matrix_engine/agentic-toolkits/bin/matrix_engine-mcp-core-server --version` (or `%USERPROFILE%\.matrix_engine\agentic-toolkits\bin\matrix_engine-mcp-core-server.exe --version` on Windows)
> - Run `amp skill list` to confirm MatrixEngine skills are visible

----

Copyright 2026 The Community, Inc.

----

