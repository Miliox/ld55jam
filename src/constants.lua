sprites = {
    summon1 = 10,
    summon2 = 11,
    player = 12,
    enemy = 13,
}

function waypoints(level)
    -- TODO: do something based on the level :D
    return { { x = 64, y = 64 },
        { x = 12, y = 96 },
        { x = 12, y = 64 },
        { x = 64, y = 12 },
        { x = 120, y = 112 } }
end

mana_rate = .2
frame_rate = 30
enemy_mana_rate = .1