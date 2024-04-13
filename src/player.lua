
player = {
    pos = {x=10, y=10},
    selected_spell = 1
}

function update_player()
    if btnp(0) then
        player.selected_spell = player.selected_spell - 1
    end
    if btnp(1) then
        player.selected_spell = player.selected_spell + 1
    end
    if btnp(5) then
        spells[player.selected_spell].func(player)
    end
    if player.selected_spell < 1 then
        player.selected_spell = 1
    elseif player.selected_spell > count(spells) then
        player.selected_spell = count(spells)
    end
end

function draw_player()
    spr(sprites.player, player.pos.x, player.pos.y)
    local x = (player.selected_spell - 1) * 9
    local y = 128 - 10
    rect(x, y, x + 9, y + 9, 14)
end
