
monster_queue = {}

function add_monster(pos, dir, wps)
    add(monster_queue, {pos=pos, dir=dir, wps=wps})
end

function draw_monsters()
    for monster in all(monster_queue) do
        spr(1, monster.pos.x, monster.pos.y)
    end

    -- for i, a in ipairs(monster_queue) do
    --     for j, b in ipairs(monster_queue) do
    --         if i != j then print(dist(a.pos.x, a.pos.y, b.pos.x, b.pos.y)) end
    --     end
    -- end

end

function update_monsters()
    -- TODO: Replace by waypoint system
    local gx = 120
    local gy = 10
    local proximity_limit = 8

    for i, monster in ipairs(monster_queue) do
        wp = monster.wps[1]

        if wp != nil then
            dx, dy = norm(diff(monster.pos.x, monster.pos.y, wp.x, wp.y))

            local x = monster.pos.x + dx * monster.dir.v
            local y = monster.pos.y + dy * monster.dir.v

            local collide = false

            for j, another in ipairs(monster_queue) do
                if i > j then
                    if dist(x, y, another.pos.x, another.pos.y) < proximity_limit then
                        collide = true;
                        break
                    end
                end
            end

            if not collide then
                monster.pos.x = x
                monster.pos.y = y
            end

            if dist(x, y, wp.x, wp.y) < 4 then
                del(monster.wps, monster.wps[1])
            end

        end
    end
end
