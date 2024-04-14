
spells = {
    -- summon
    {
        sprite = function() return sprites.summon1 + player.element_idx - 1 end,
        func = function(caster, reverse)
            reverse = reverse or false
            wps = waypoints(nil)
            if reverse then
                wps = rev(wps)
            end
            add_monster(caster.queue, {x=caster.pos.x, y=caster.pos.y}, {v=1,looking_left=true}, wps,
        elements[caster.element_idx])
        end,
        cost = 1
    },
    -- change element
    {
        sprite = function() return sprites.change_element end,
        func = function(caster)
            caster.element_idx = caster.element_idx + 1
            if caster.element_idx > #elements then
                caster.element_idx = 1
            end
        end,
        cost = 1
    },
}

function draw_gui()
    line(0, 117, 127, 117, 1)
    rectfill(0, 118, 127, 127, 0)
    local x = (player.selected_spell - 1) * 9
    local y = 128 - 10
    rect(x, y, x + 9, y + 9, 14)
    local x = 1
    for spell in all(spells) do
        spr(spell.sprite(), x, 128 - 9)
        x = x + 9
    end
    rect(x, y, x + 20, y + 9, 15)
    rectfill(x+1, y+1, x + 19 * player.mana / player.max_mana, y + 8, 14)
end
