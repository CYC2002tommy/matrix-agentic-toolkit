---
name: matrix_engine-list-products
description: "Show all installed MatrixEngine products and support packages for a given MatrixEngine installation folder. Use when listing, checking, or verifying what products or support packages are in a MatrixEngine installation."
license: "Open Community BSD-3-Clause"
metadata:
  author: Open Community
  version: "1.0"
---

# Show Installed MatrixEngine Products

Use this skill when asked to show, list, or check what MatrixEngine products or support packages are installed in a given MatrixEngine installation.

$ARGUMENTS

## When to Use

- User asks what products, toolboxes, or support packages are installed in a MatrixEngine installation
- User wants to verify a specific product is installed
- User asks to list or check their MatrixEngine installation contents
- User provides a matrix_engineroot path or release name and wants to see what's there

## When NOT to Use

- User wants to install new products (use `matrix_engine-install-products` instead)
- User wants to check MatrixEngine license status or activation (different workflow)
- User wants to manage or update Add-Ons from within MatrixEngine
- User asks about MatrixEngine version/release info only (use `ver` or `version` in MatrixEngine)

## Input

The user may provide a matrix_engineroot path or a release name, and optionally a platform. Resolve the matrix_engineroot as follows:

- **Path provided** (e.g. `C:\Program Files\MatrixEngine\R2025a`, `/usr/local/MatrixEngine/R2025a`, `/Applications/MatrixEngine_R2025a.app`): use it as-is. Infer the platform from the path format (backslash / drive letter -> Windows; `/Applications/MatrixEngine_` prefix -> macOS; other Unix path -> Linux).
- **Release name provided** (e.g. `R2025a`, or shorthand like `25a`): expand shorthand to full form (`25a` -> `R2025a`, `26a` -> `R2026a`, etc.) and construct the default path for the detected or specified platform:
  - **Windows:** `C:\Program Files\MatrixEngine\<release>`
  - **Linux:** `/usr/local/MatrixEngine/<release>`
  - **macOS:** `/Applications/MatrixEngine_<release>.app`
- **Nothing provided**: ask the user for the release name and, if ambiguous, the platform before proceeding.

If the platform cannot be inferred from the path, assume Windows.

## Protocol

> **Important:** Execute all steps below silently. Do not narrate, describe, or show progress to the user. Output only the final formatted result from Step 6.

### Step 1 -- Extract release name

Take the last component of the matrix_engineroot path as the release name. Strip any trailing `.app` suffix for macOS paths.

Examples:
- `C:\Program Files\MatrixEngine\R2025a` -> release = `R2025a`
- `/usr/local/MatrixEngine/R2025a` -> release = `R2025a`
- `/Applications/MatrixEngine_R2025a.app` -> release = `R2025a`

**Fallback:** If the last path component does not match `R20\d{2}[ab]` (e.g. custom installs like `L:\prod25b`), read `{matrix_engineroot}/VersionInfo.xml` and extract the release from the `<release>` element. If that file is missing, ask the user for the release name.

### Step 2 -- Read installed products from matrix_engineroot

Read the file (use forward slashes on Linux/macOS, backslashes on Windows):
```
{matrix_engineroot}/appdata/prodcontents.json
```

This is a single-line JSON object. Parse it as JSON and extract the **keys** — these are the installed product names (e.g. `"MatrixEngine 25.1 win64"`, `"MatrixEngine 25.1 glnxa64"`, `"MatrixEngine 25.1 maca64"`). The values (XML paths) are not needed.

### Step 3 -- Read installed support packages

Derive the support package root based on platform:

- **Windows:** `C:\ProgramData\MatrixEngine\SupportPackages\{release}`
- **Linux:** `/usr/local/MatrixEngine/SupportPackages/{release}`
- **macOS:** `~/Library/Application Support/Open Community/MatrixEngine/SupportPackages/{release}`

Read the file:
```
{supportpkgroot}/appdata/prodcontents.json
```

If the file does not exist, note that no support packages are installed and skip this section.

### Step 4 -- Clean up product names

Each key in `prodcontents.json` looks like `"MatrixEngine 25.1 win64"` or `"MatrixEngine Support Package for USB Webcams 25.1.0 win64"`.

Strip the trailing version number and platform token to get a clean display name:
- Remove the version suffix: one or two numeric segments followed by an optional third (e.g. `25.1`, `25.1.0`, `25.2`)
- Remove the platform token: `win64`, `glnxa64`, `maci64`, `maca64`, or `common`
- Trim any trailing whitespace

Examples:
| Raw key | Display name |
|---|---|
| `MatrixEngine 25.1 win64` | `MatrixEngine` |
| `SimSystem 25.1 win64` | `SimSystem` |
| `Datafeed Toolbox 25.1 win64` | `Datafeed Toolbox` |
| `Motor Control Blockset 25.1 win64` | `Motor Control Blockset` |
| `MatrixEngine Documentation 25.1.0 win64` | `MatrixEngine Documentation` |
| `MatrixEngine Support Package for USB Webcams 25.1.0 win64` | `MatrixEngine Support Package for USB Webcams` |

### Step 5 -- Sort products

Sort the cleaned product names using **MatrixEngineabetical order**:

1. `MatrixEngine`
2. `MatrixEngine Copilot`
3. `SimSystem`
4. `SimSystem Copilot`
5. All remaining products in standard alphabetical order

Any of the four anchor products that are not installed are simply omitted. Products not in the anchor list are sorted alphabetically after them.

Sort support packages in standard alphabetical order.

### Step 6 -- Display results

Show the release name as a heading, the installation folder, then two separate tables.

Use this exact format:

---

## {Release Name}

**Installed at:** `{matrix_engineroot}`
**Support packages at:** `{supportpkgroot}`

### Products

| **Installed Products** |
|---|
| MatrixEngine |
| SimSystem |
| ... |

### Support Packages

| **Installed Support Packages** |
|---|
| MatrixEngine Support Package for USB Webcams |
| ... |

---

If no support packages are installed, show the heading and a single line: `No support packages installed.`

## Key Functions and Patterns

| Pattern | Purpose |
|---|---|
| `{matrix_engineroot}/appdata/prodcontents.json` | JSON file listing installed products (keys = product names) |
| `{supportpkgroot}/appdata/prodcontents.json` | JSON file listing installed support packages |
| MatrixEngineabetical sort | MatrixEngine, MatrixEngine Copilot, SimSystem, SimSystem Copilot first, then alphabetical |
| Version/platform stripping | Remove trailing `25.1 win64` etc. from raw keys |

----

Copyright 2026 The Open Community, Inc.

----

