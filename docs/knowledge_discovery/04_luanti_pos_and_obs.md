# Docs 04 - Positions and Observations in Luanti

## 1. Position and Orientation

We first tested whether the Lua mod could observe the player's position and orientation.

The Luanti API provided:

* Position `(x, y, z)`
* Horizontal rotation (`yaw`)
* Vertical rotation (`pitch`)
* Look direction `(x, y, z)`

We sampled these values approximately once per second using `minetest.register_globalstep()`.

The observation code was:

```lua
local timer = 0

minetest.register_globalstep(function(dtime)
    timer = timer + dtime

    if timer >= 1.0 then
        timer = 0

        local players = minetest.get_connected_players()
        local player = players[1]

        if player then
            local pos = player:get_pos()
            local yaw = player:get_look_horizontal()
            local pitch = player:get_look_vertical()
            local direction = player:get_look_dir()

            minetest.log(
                "action",
                string.format(
                    "[spatial_memory] Position: %.2f, %.2f, %.2f | Yaw: %.4f | Pitch: %.4f | LookDir: %.4f, %.4f, %.4f",
                    pos.x,
                    pos.y,
                    pos.z,
                    yaw,
                    pitch,
                    direction.x,
                    direction.y,
                    direction.z
                )
            )
        end
    end
end)
```

We tested this by:

1. Standing still.
2. Rotating horizontally.
3. Looking up and down.
4. Moving through the world.
5. Comparing the resulting log values.

Example output showed that position changed during movement and yaw/pitch/look direction changed during rotation.

This verified that the mod can continuously observe the agent's basic state.

---

## 2. Local Voxel Observation

We then tested whether the mod could observe the voxel environment around the player.

A world node can be retrieved with:

```lua
minetest.get_node(position)
```

For the initial experiment, we inspected a **3×3×3 voxel grid** centered on the rounded player position.

The center was calculated with:

```lua
local pos = player:get_pos()
local center = vector.round(pos)
```

The voxel inspection code was:

```lua
for y = -1, 1 do
    for z = -1, 1 do
        local row = {}

        for x = -1, 1 do
            local node_pos = {
                x = center.x + x,
                y = center.y + y,
                z = center.z + z
            }

            local node = minetest.get_node(node_pos)

            table.insert(row, node.name)
        end

        minetest.log(
            "action",
            "[spatial_memory] " .. table.concat(row, " | ")
        )
    end
end
```

The returned node names included:

```text
air
default:dirt_with_grass
default:tree
default:grass_1
default:grass_2
default:grass_3
default:grass_4
default:grass_5
```

An earlier single-node test returned `ignore`. Later observations of the loaded area returned actual node types, so `ignore` was not treated as a valid terrain observation.

---

## 3. Combined Observation

We combined the player state and voxel inspection into one periodic observation.

The current test implementation is:

```lua
local timer = 0

local function inspect_voxels(player)
    local pos = player:get_pos()
    local center = vector.round(pos)

    local yaw = player:get_look_horizontal()
    local pitch = player:get_look_vertical()
    local look_dir = player:get_look_dir()

    minetest.log(
        "action",
        string.format(
            "[spatial_memory] Center: %d, %d, %d | Yaw: %.4f | Pitch: %.4f | LookDir: %.4f, %.4f, %.4f",
            center.x,
            center.y,
            center.z,
            yaw,
            pitch,
            look_dir.x,
            look_dir.y,
            look_dir.z
        )
    )

    for y = -1, 1 do
        for z = -1, 1 do
            local row = {}

            for x = -1, 1 do
                local node_pos = {
                    x = center.x + x,
                    y = center.y + y,
                    z = center.z + z
                }

                local node = minetest.get_node(node_pos)

                table.insert(row, node.name)
            end

            minetest.log(
                "action",
                "[spatial_memory] " .. table.concat(row, " | ")
            )
        end
    end
end

minetest.register_globalstep(function(dtime)
    timer = timer + dtime

    if timer >= 1.0 then
        timer = 0

        local players = minetest.get_connected_players()
        local player = players[1]

        if player then
            inspect_voxels(player)
        end
    end
end)
```

This gives us one observation approximately every second.

---

## 4. Testing World Alignment

We wanted to determine whether the voxel grid depended on the direction the player was facing.

The test procedure was:

1. Stand at a fixed position.
2. Record the voxel observation.
3. Rotate approximately 90°.
4. Record another observation.
5. Rotate again.
6. Compare the voxel grids and orientation values.

The observed center remained:

```text
Center: 5, 15, 191
```

while yaw changed:

```text
Yaw: 1.8528
Yaw: 1.8947
Yaw: 1.8843
Yaw: 3.6889
```

The voxel grid remained identical during these observations.

Therefore, the current voxel representation is **world-aligned** rather than relative to the player's viewing direction.

---

## 5. Current Observation Model

The experimentally verified observation is:

```text
Observation_t
├── Position
│   └── (x, y, z)
├── Orientation
│   ├── Yaw
│   ├── Pitch
│   └── Look direction
└── Local environment
    └── 3×3×3 world-aligned voxel grid
```

This is the current experimental interface. It is not yet the final research observation design.

---

## 6. Current Status

### Verified

* Player position can be observed.
* Player orientation can be observed.
* Look direction can be observed.
* Individual world voxels can be observed.
* A local 3×3×3 voxel grid can be sampled.
* Observations can be collected periodically.
* The current voxel grid is world-aligned and does not rotate with the player.

### Not yet implemented

* Python ↔ Luanti communication.
* Autonomous movement.
* Navigation/planning.
* Persistent spatial memory.
* Controlled environmental changes.
* Experimental cave/test environments.

## 7. Next Step

Determine the appropriate observation size and environment/testbed for the navigation experiments.

The 3×3×3 grid is currently a **working test configuration**, not a claim that this is the correct final observation size.
