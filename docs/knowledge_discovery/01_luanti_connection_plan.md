# Docs 01 - Connection between the project and Luanti (Initial Understanding)

## 1. Overview
- Luanti is based on Lua, and does not provide a direct API or library to connect to Python.
- Luanti itself is designed to be extensible, and can be extended with Lua mods.
- These Lua mods can inspect and modify the game world and state through the Luanti API.

## 2. Proposed Solution
- Python as the research/agent side
- Luanti server-side Lua mod as the bridge
- Communication via HTTP/REST API (initially)

### 2.1. Proposed Architecture
```
┌─────────────────────────────┐
│       Your Python code      │
│                             │
│  agent                      │
│  navigation                 │
│  memory                     │
│  experiments                │
│  metrics                    │
└──────────────┬──────────────┘
               │
               │ communication
               │
┌──────────────▼──────────────┐
│       Luanti Lua mod        │
│                             │
│  observe world              │
│  move agent                 │
│  change blocks              │
│  report state               │
└──────────────┬──────────────┘
               │
┌──────────────▼──────────────┐
│       Luanti / MTG          │
│                             │
│       voxel world           │
└─────────────────────────────┘
```

## 3. Current Decision
- Do NOT build the Python bridge yet.
- **Get a custom Luanti mod running and prove that our mod can observe the world.**

## 4. Outcome
- Created an empty custom Luanti mod that can observe the world.
```
~/Projects/persistent-spatial-memory main*
❯ ls luanti/mods
drwxr-xr-x - aveey  1 Oct 22:29  spatial_memory

~/Projects/persistent-spatial-memory main*
❯ ls luanti/mods/spatial_memory/
.rw-r--r-- 0 aveey  1 Oct 22:29  init.lua
.rw-r--r-- 0 aveey  1 Oct 22:29 󱁻 mod.conf
```
