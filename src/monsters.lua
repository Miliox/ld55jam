
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
    fight()
end

function update_monster_queue(queue)

    for i, monster in ipairs(queue) do
        wp = monster.wps[1]
        if not wp then
            goto continue
        end
        dx, dy = norm(diff(monster.pos.x, monster.pos.y, wp.x, wp.y))

        local x = monster.pos.x + dx * monster.dir.v
        local y = monster.pos.y + dy * monster.dir.v
        local looking_left = dx <= 0

        local collide = false

        for j, another in ipairs(queue) do
            if i > j then
                if in_collision({x=x, y=y}, another.pos) then
                    collide = true
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

        ::continue::
    end
end

function in_collision(pos1, pos2)
    local proximity_limit = 8
    return dist(pos1.x, pos1.y, pos2.x, pos2.y) < proximity_limit
end

function fight()
    local player_monster = player_monster_queue[1]
    local enemy_monster = enemy_monster_queue[1]
    if player_monster and enemy_monster and in_collision(player_monster.pos, enemy_monster.pos) then
        player_monster_died, enemy_monster_died = monster_fight(player_monster, enemy_monster)
        if player_monster_died then
            deli(player_monster_queue, 1)
        end
        if enemy_monster_died then
            deli(enemy_monster_queue, 1)
        end
    end
    if player_monster and in_collision(player_monster.pos, enemy.pos) then
        enemy.health = enemy.health - 1
        deli(player_monster_queue, 1)
    end
    if enemy_monster and in_collision(enemy_monster.pos, player.pos) then
        player.health = player.health - 1
        deli(enemy_monster_queue, 1)
    end
end

function monster_fight(left, right)
    return true, true
end