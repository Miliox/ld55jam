
player_monster_queue = {}
enemy_monster_queue = {}

function all_monsters()
    return player_monster_queue..enemy_monster_queue
end

function add_monster(queue, pos, dir, wps)
    add(queue, {pos=pos, dir=dir, wps=wps})
end

function draw_monsters()
    draw_monster_queue(player_monster_queue)
    draw_monster_queue(enemy_monster_queue)
end

function draw_monster_queue(queue)
    for monster in all(queue) do
        spr(1, monster.pos.x, monster.pos.y, 1, 1, monster.dir.looking_left)
    end

    -- for i, a in ipairs(monster_queue) do
    --     for j, b in ipairs(monster_queue) do
    --         if i != j then print(dist(a.pos.x, a.pos.y, b.pos.x, b.pos.y)) end
    --     end
    -- end

end

function update_monsters()
    update_monster_queue(player_monster_queue)
    update_monster_queue(enemy_monster_queue)
end


function update_monster_queue(queue)
    -- TODO: Replace by waypoint system
    local gx = 120
    local gy = 10
    local proximity_limit = 8

    for i, monster in ipairs(queue) do
        wp = monster.wps[1]

        if wp != nil then
            dx, dy = norm(diff(monster.pos.x, monster.pos.y, wp.x, wp.y))

            local x = monster.pos.x + dx * monster.dir.v
            local y = monster.pos.y + dy * monster.dir.v
            local looking_left = dx <= 0

            local collide = false

            for j, another in ipairs(queue) do
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
                monster.dir.looking_left = looking_left
            end

            if dist(x, y, wp.x, wp.y) < 4 then
                del(monster.wps, monster.wps[1])
            end

        end
    end
end
