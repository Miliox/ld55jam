
player = {
    pos = {x=10, y=10},
    selected_spell = 1,
    mana = 5,
    max_mana = 5,
    queue = player_monster_queue,
    health = 3,
    element_idx = 1,
    target_idx = 1,
}

function init_player()
    player.pos = waypoints()[1]
end

-- Button Map:
-- ⬆️, ⬇️, ⬅️, ➡️, 🅾️, and ❎
-- 0, 1, 2, 3, 4, and 5

function select_spell()
    if btnp(⬅️) then
        player.selected_spell = player.selected_spell - 1
    end
    if btnp(➡️) then
        player.selected_spell = player.selected_spell + 1
    end
    if btnp(❎) then
        local spell = spells[player.selected_spell]
        if player.mana >= spell.cost then
            spell.func(player)
            player.mana = player.mana - spell.cost
        else
            -- TODO: indicate that it is impossible somehow!
        end
    end
    if player.selected_spell < 1 then
        player.selected_spell = 1
    elseif player.selected_spell > count(spells) then
        player.selected_spell = count(spells)
    end
end

function select_target()
    if btnp(⬅️) then
        player.target_idx = player.target_idx - 1
    end
    if btnp(➡️) then
        player.target_idx = player.target_idx + 1
    end
    if btnp(❎) then
        player.active_spell.complete(get_monster(player.target_idx))
        player.active_spell = nil
    end
    if btnp(🅾️) then
        player.active_spell = nil
    end
    print("select_target")
    if player.target_idx < 1 then
        player.target_idx = 1
    elseif player.target_idx > get_monster_count() then
        player.target_idx = get_monster_count()
    end
end
function update_player()
    if player.active_spell then
        select_target()
    else
        select_spell()
    end

    player.mana = player.mana + mana_rate / frame_rate
    if player.mana > player.max_mana then
        player.mana = player.max_mana
    end
end

function draw_player()
    spr(sprites.player, player.pos.x, player.pos.y, 1, 1, false, player.health <= 0)
    if player.health == 0 then
        print("You died")
    end
    if player.active_spell then
        player.active_spell.draw(player.active_spell)
    end
end
