sprites = {
    fire_monster = 1,
    water_monster = 2,
    earth_monster = 3,
    summon1 = 24,
    change_element = 11,
    smite1 = 27,
    player = 12,
    enemy = 13,
}

function waypoints(level)
    -- TODO: do something based on the level :D
    return { { x = 64, y = 64 },
        { x = 12, y = 96 },
        { x = 12, y = 64 },
        { x = 64, y = 12 },
        { x = 115, y = 105 } }
end

mana_rate = .2
frame_rate = 30
enemy_mana_rate = .1