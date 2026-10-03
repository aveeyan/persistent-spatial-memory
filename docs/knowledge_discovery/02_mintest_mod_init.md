# Docs 02 - Understanding Minetest Mods

## 1. Overview

Luanti is extensible through Lua mods.

A mod can execute Lua code inside a Luanti world and interact with the running game through the Luanti API.

For this project, the Lua mod provides the initial interface between the Luanti simulation and the research agent.

## 2. Custom Mod

We created:

```text
persistent-spatial-memory/
└── luanti/
    └── mods/
        └── spatial_memory/
            ├── init.lua
            └── mod.conf
```

`mod.conf`:

```text
name = spatial_memory
description = Persistent Spatial Memory research interface
```

The mod was enabled for the test world with:

```text
load_mod_spatial_memory = true
```

The world is located at:

```text
~/.minetest/worlds/world1
```

## 3. Verification

The mod successfully loaded and executed inside Luanti.

Example:

```text
[spatial_memory] Research mod loaded successfully!
```

This established the basic connection:

```text
Luanti world
    ↓
Lua mod
    ↓
spatial_memory
```

## 4. Current Understanding

The Lua mod can:

* execute code inside the running world;
* access player state;
* access world state through the Luanti API;
* observe the environment periodically;
* modify the world in future experiments.

The Python research agent has not yet been connected.

The current priority is to establish a reliable Luanti-side observation interface before implementing the Python bridge.
