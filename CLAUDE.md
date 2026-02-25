# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Lucent Light is a **Minecraft Bedrock Edition resource pack** for Deferred Rendering (PBR). It provides cool-toned vibrant visuals with blue skies, balanced contrast, and subtle reflections. The entire pack is JSON configuration — no shader code or textures.

**Requirements:** Minecraft Bedrock v1.21.80+, ray-tracing capable hardware.

## Build & Package

```bash
./pack.sh          # Creates Lucent-Light-v1.0.0.mcpack (zip archive)
```

When bumping version: update both `manifest.json` (`header.version`) and `pack.sh` (`VERSION` variable).

## Architecture

Each visual system lives in its own directory with a single JSON config file:

| Directory | File | Purpose | Format Version |
|---|---|---|---|
| `atmospherics/` | `atmospherics.json` | Sky colors, Rayleigh/Mie scattering | 1.21.40 |
| `color_grading/` | `color_grading.json` | ACES tone mapping, contrast, color temp (7800K) | 1.21.90 |
| `lighting/` | `global.json` | Sun/moon illuminance curves and colors | 1.21.80 |
| `pbr/` | `global.json` | Material fallback metalness/roughness | 1.21.40 |
| `point_lights/` | `global_point_lights.json` | Block light source colors (40+ blocks) | 1.21.40 |
| `shadows/` | `shadows.json` | Shadow style (soft_shadows) | 1.21.80 |
| `water/` | `water.json` | Wave simulation (24 octaves), caustics | 1.21.80 |

`manifest.json` declares the pack with `"capabilities": ["pbr"]` and module type `"resources"`.

## Key Conventions

- **Namespace prefix**: `lucent_light:` for custom identifiers
- **Colors**: RGB arrays `[0-255, 0-255, 0-255]`
- **Time keys**: Decimal `0.0` to `1.0` representing the day/night cycle
- **Block references**: Use Minecraft namespace, e.g. `minecraft:torch`
- **Format versions**: Each system declares its own minimum version (not pack-wide)
- **Light palette**: Warm white `(230, 220, 175)` for standard lights, red for redstone, cyan for soul lights

## Pack Manifest UUIDs

- Header: `a1b2c3d4-e5f6-7890-abcd-ef1234567890`
- Resources module: `f0e1d2c3-b4a5-6789-0fed-cba987654321`

These must remain stable — changing them breaks existing installations.
