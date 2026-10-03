# Docs 03 - Luanti API and World Observation

## 1. Player State

The Luanti API allows the mod to observe the player's:

* Position `(x, y, z)`
* Yaw
* Pitch
* Look direction `(x, y, z)`

Position changes when the player moves, while yaw and pitch change when the player looks around.

## 2. Periodic Observation

The mod uses `minetest.register_globalstep()` to perform observations approximately once per second.

This allows the agent's state and environment to be sampled over time.

## 3. Voxel Observation

World nodes can be accessed using:

```lua
minetest.get_node(position)
```

For initial testing, we inspect a **3×3×3 voxel grid** centered on the rounded player position.

Each voxel is represented by its Luanti node name, such as:

```text
air
default:dirt_with_grass
default:tree
default:grass_1
```

An initial query returned `ignore`, but subsequent observations of loaded areas returned actual node types. The observation interface therefore needs to account for world/node availability.

## 4. World-Aligned Observation

The player was rotated in place while remaining at the same position.

The yaw changed, while the voxel grid remained unchanged.

Therefore, the current voxel observation is **world-aligned** and independent of the player's viewing direction.

## 5. Current Observation

The current experimental observation is:

```text
Observation_t
├── position
├── yaw
├── pitch
├── look direction
└── 3×3×3 world-aligned voxel grid
```

This is an initial observation interface, not yet the final research design.

## 6. Current State

Verified:

* player position observation;
* player orientation observation;
* local voxel observation;
* periodic environment sampling;
* world-aligned voxel representation.

Not yet implemented:

* Python ↔ Luanti communication;
* navigation agent;
* persistent spatial memory;
* controlled environmental changes.

The next question is what observation size and environment structure are appropriate for the navigation experiments.
