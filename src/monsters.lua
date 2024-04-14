
player_monster_queue = {}
enemy_monster_queue = {}

elements = {
    "fire", -- burns earth
    "water", -- puts out fire
    "earth", -- fills in water
}

function add_monster(queue, pos, dir, wps, element)
    add(queue, 
        {
            pos = pos,
            dir = dir,
            wps = wps,
            element = element,
            parent = queue,
        })
end

function draw_monsters()
    draw_monster_queue(player_monster_queue)
    draw_monster_queue(enemy_monster_queue)
end

function get_monster(idx)
    if idx <= #player_monster_queue then
        return player_monster_queue[idx]
    end
    return enemy_monster_queue[idx - #player_monster_queue]
end

function get_monster_count()
    return #player_monster_queue + #enemy_monster_queue
end

function draw_monster_queue(queue)
    for monster in all(queue) do
        spr(sprites[monster.element.."_monster"], monster.pos.x, monster.pos.y, 1, 1, monster.dir.looking_left)
    end
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

function wins(left_element, right_element)
    if (left_element == "fire" and right_element == "earth")
        or (left_element == "water" and right_element == "fire")
        or (left_element == "earth" and right_element == "water") then
        return true
    end
    return false
end

function monster_fight(left, right)
    if left.element == right.element then
        return true, true
    end
    if wins(left.element, right.element) then
        return false, true
    end

    return true, false
end