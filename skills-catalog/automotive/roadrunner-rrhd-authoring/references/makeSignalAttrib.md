# Skill: makeSignalAttrib

**Package:** `rrhd_authoring.utils`
**Function:** `pa = rrhd_authoring.utils.makeSignalAttrib(signalID, span)`
**Source:** `+rrhd_authoring/+utils/makeSignalAttrib.m`

## Description
Creates a `ParametricAttribution` with a `SignalReference` for attaching traffic signals to lanes over a parametric span.

## Inputs
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `signalID` | string | (required) | ID of the Signal to reference |
| `span` | [1x2] double | `[0 1]` | Parametric span [start end] in [0,1] |

## Output
`pa` — `roadrunner.hdmap.ParametricAttribution` with `.SignalReference` and `.Span`.

## Implementation
```matrix_engine
sigRef = roadrunner.hdmap.SignalReference( ...
    SignalID=roadrunner.hdmap.Reference(ID=signalID));

pa = roadrunner.hdmap.ParametricAttribution( ...
    SignalReference=sigRef, ...
    Span=span);
```

## Example
```matrix_engine
pa = rrhd_authoring.utils.makeSignalAttrib("TL_North", [0.8 1.0]);
```

----

Copyright 2026 The Community, Inc.
