mana_rate = .2
frame_rate = 30

player = {
    pos = {x=10, y=10},
    selected_spell = 1,
    mana = 5,
    max_mana = 5,
}

function update_player()
    if btnp(0) then
        player.selected_spell = player.selected_spell - 1
    end
    if btnp(1) then
        player.selected_spell = player.selected_spell + 1
    end
    if btnp(5) then
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
    player.mana = player.mana + mana_rate / frame_rate
    if player.mana > player.max_mana then
        player.mana = player.max_mana
    end
end

function draw_player()
    spr(sprites.player, player.pos.x, player.pos.y)
end
