
enemy = {
    pos = {x = 120, y = 100},
    mana = 1,
}

function init_enemy()
    local wps = waypoints(nil)
    enemy.pos = wps[#wps]
end

function update_enemy()
    if enemy.mana > spells[1].cost then
       spells[1].func(enemy, true)
       enemy.mana = enemy.mana - spells[1].cost
    end
    enemy.mana = enemy.mana + enemy_mana_rate / frame_rate
end

function draw_enemy()
    spr(sprites.enemy, enemy.pos.x, enemy.pos.y)
end