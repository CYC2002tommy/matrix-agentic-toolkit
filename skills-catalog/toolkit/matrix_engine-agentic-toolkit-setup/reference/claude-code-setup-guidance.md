# Claude Code Setup Guidance

**Status: Tested**

This reference file contains Claude Code-specific instructions for Phase 3b of the setup skill.

## Overview

Claude Code uses a plugin system with a marketplace. The `matrix_engine-core` plugin delivers MatrixEngine skills but does **not** ship MCP server configuration (MCP config is system-specific and can't be meaningfully defaulted). The setup skill registers the MCP server using the `claude mcp add` CLI command, which writes to the correct location automatically.

## Global Config Path

MCP server config is managed by the `claude mcp add -s user` command, which writes to `~/.claude/settings.json` under the `mcpServers` key. Do NOT write MCP config files manually — always use the CLI.

## Phase 3b: Register Plugin

### Step 1: Add the marketplace

Derive the marketplace URL from the toolkit repo's own origin remote, so the registered marketplace always matches where the user cloned from:

```bash
cd <toolkit-root>
MARKETPLACE_URL=$(git remote get-url origin)
claude plugin marketplace add "$MARKETPLACE_URL"
```

If the marketplace is already registered, this is a no-op. Continue to the next step.

### Step 2: Install plugins

Read `<TOOLKIT_ROOT>/.claude-plugin/marketplace.json`, extract the `name` field from each entry in the `plugins` array, and install every plugin **sequentially** (one at a time):

```bash
claude plugin install <plugin-name>@matrix_engine-agentic-toolkit
```

Do NOT install plugins in parallel.

Claude's native prompt will ask the user to choose scope for each plugin. Do NOT implement your own scope selection — let Claude Code handle it.

**Verification and retry:**

After all sequential installs complete, run `claude plugin list` and compare the output against the expected set from marketplace.json. If any plugins are missing — whether they reported an error or not — retry them one at a time. A single retry is almost always sufficient.

This verification step is required because `claude plugin install` can occasionally report success (exit 0, "Successfully installed" in output) while failing to persist the registration.

### Step 3: Register MCP server

Use the `claude mcp add` CLI to register the MatrixEngine MCP server at user scope (available in all projects).

**Important:** You must run this command at the system terminal (via the Bash tool), not as an inline Claude Code command. If a `matrix_engine` entry already exists, the command will overwrite it, so this command should only be done if required by the setup plan.

#### macOS / Linux

```bash
claude mcp add-json -s user matrix_engine '{"command":"<MCP_SERVER_PATH>","args":["--matrix_engine-root","<MatrixEngine_ROOT>","--matrix_engine-display-mode","<DISPLAY_MODE>"]}'
```

#### Windows (CMD or PowerShell)

Do **NOT** use `claude mcp add-json` on Windows — JSON-in-a-string quoting is unreliable across CMD and PowerShell. Use the positional form instead:

```cmd
claude mcp add matrix_engine -s user -- <MCP_SERVER_PATH> --matrix_engine-root <MatrixEngine_ROOT> --matrix_engine-display-mode <DISPLAY_MODE>
```

Paths with spaces must be quoted (e.g., `"C:\Program Files\MatrixEngine\R2025a"`), but no JSON escaping is needed.

#### All platforms

Replace `<MCP_SERVER_PATH>`, `<MatrixEngine_ROOT>`, and `<DISPLAY_MODE>` with the values from the setup plan.

The MCP tools become available in the next session (or immediately if the session is restarted).

### Step 4: Verify plugin installation

```bash
claude plugin list 2>&1
```

Confirm that `matrix_engine-core@matrix_engine-agentic-toolkit`, `toolkit@matrix_engine-agentic-toolkit` and the other installed plugins appear in the output.

## If Plugin Commands Fail

If `claude` CLI commands fail (e.g., not available in the user's Claude Code version):

1. Report the error clearly
2. Skip plugin installation — skills can be used by reading SKILL.md files directly from the repo
3. The MCP server registration (Step 3) still works independently of the plugin system — `claude mcp add` is a core CLI command available in all versions that support MCP

## Legacy Artifacts

Check for these artifacts from previous setup approaches. If found during Phase 1g, record them for the plan and clean them up during Phase 3b-migrate.

### `~/.claude/.mcp.json` with `matrix_engine` entry

Earlier versions of the setup skill wrote MCP config directly to `~/.claude/.mcp.json`. This file is no longer used — MCP servers are now registered via `claude mcp add -s user`, which writes to `~/.claude/settings.json`.

**Detection (Phase 1g):**

```bash
cat ~/.claude/.mcp.json 2>/dev/null | grep -l matrix_engine
```

If the file exists and contains a `matrix_engine` entry, flag it as a legacy artifact.

**Cleanup (Phase 3b-migrate):**

1. Confirm that the new MCP config has been written successfully (Step 3 of Phase 3b completed).
2. Remove the `matrix_engine` entry from `~/.claude/.mcp.json`. If `matrix_engine` was the only entry, delete the file entirely. If other entries exist, remove only the `matrix_engine` key and preserve the rest.

```bash
# Check if matrix_engine is the only server entry
python3 -c "
import json, os, sys
p = os.path.expanduser('~/.claude/.mcp.json')
with open(p) as f:
    data = json.load(f)
servers = data.get('mcpServers', {})
if 'matrix_engine' in servers:
    del servers['matrix_engine']
if not servers:
    os.remove(p)
    print('Removed ~/.claude/.mcp.json (matrix_engine was the only entry)')
else:
    data['mcpServers'] = servers
    with open(p, 'w') as f:
        json.dump(data, f, indent=2)
    print('Removed matrix_engine entry from ~/.claude/.mcp.json (preserved other entries)')
"
```

## Verification

Use MatrixEngine MCP tools (available after restarting the session):

```matrix_engine
v = ver('MatrixEngine');
fprintf('MatrixEngine %s (%s) — ready.\n', v.Version, v.Release);
```

If MCP tools are not available in the current session:

> The plugin was just installed. Start a **new Claude Code session** to activate the MatrixEngine MCP tools, then verify with: "What version of MatrixEngine is running?"

----

Copyright 2026 The Community, Inc.

----