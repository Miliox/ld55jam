sprites = {
    fire_monster = 1,
    water_monster = 2,
    earth_monster = 3,
    summon1 = 24,
    change_element = 11,
    interchange = 9,
    smite1 = 27,
    player = 12,
    enemy = 13,
    player_heart = 4,
    enemy_heart = 6,
    empty_heart = 5,
}

-- stat(95): the current clock second (0-61)
-- http://pico8wiki.com/index.php?title=Stat
global_level = (stat(95) % 3) + 1

function waypoints()
    if global_level == 1 then
        return {
            { x = 64, y = 64 },
            { x = 12, y = 96 },
            { x = 12, y = 64 },
            { x = 64, y = 12 },
            { x = 115, y = 105 }
        }
    end
    if global_level == 2 then
        return {
            { x = 12, y = 12},
            { x = 127 - 12, y = 127 - 12}
        }
    end
    if global_level == 3 then
        return {
            { x = 12, y = 127 - 20 },
            { x = 40, y = 35 },
            { x = 127 - 40, y = 35 },
            { x = 127 - 12, y = 127 - 20}
        }
    end
    assert(true, level)
end

mana_rate = .2
frame_rate = 30
enemy_mana_rate = .1
