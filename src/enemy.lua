
enemy = {
    pos = {x = 120, y = 100},
    mana = 1,
    queue = enemy_monster_queue,
    health = 3,
    element_idx = 1,
}

function init_enemy()
    local wps = waypoints()
    enemy.pos = wps[#wps]
end

function update_enemy()
    if enemy.mana > spells[1].cost then
       spells[1].func(enemy, true)
       enemy.mana = enemy.mana - spells[1].cost
    end
    enemy.mana = enemy.mana + enemy_mana_rate / frame_rate
    enemy.element_idx = flr(rnd(3)) + 1
end

function draw_enemy()
    spr(sprites.enemy, enemy.pos.x, enemy.pos.y, 1, 1, true, enemy.health <= 0)
    if enemy.health == 0 then
        print("You won")
    end
end
