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
