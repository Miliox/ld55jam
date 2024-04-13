
monster_queue = {}

function add_monster(pos)
    add(monster_queue, {pos=pos})
end

function draw_monsters()
    for monster in all(monster_queue) do
        spr(1, monster.pos.x, monster.pos.y)
    end
end

function update_monsters()
    -- TODO: Replace by waypoint system
    gx = 120
    gy = 10

    for monster in all(monster_queue) do
        dx, dy = norm(diff(monster.pos.x, monster.pos.y, gx, gy))
        monster.pos.x += dx * monster.pos.v
        monster.pos.y += dy * monster.pos.v
    end
end
