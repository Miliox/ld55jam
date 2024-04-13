
spells = {
    {
        sprite = sprites.summon1,
        func = function(caster)
            wps = waypoints(nil)
            add_monster({x=caster.pos.x, y=caster.pos.y}, {v=0.5}, wps)
        end,
        cost = 1
    },
    {
        sprite = sprites.summon2,
        func = function(caster)
            wps = waypoints(nil)
            add_monster({x=caster.pos.x, y=caster.pos.y}, {v=0.7}, wps)
        end,
        cost = 2
    }
}

function draw_gui()
    local x = (player.selected_spell - 1) * 9
    local y = 128 - 10
    rect(x, y, x + 9, y + 9, 14)
    local x = 1
    for spell in all(spells) do
        spr(spell.sprite, x, 128 - 9)
        x = x + 9
    end
    rect(x, y, x + 20, y + 9, 15)
    rectfill(x+1, y+1, x + 19 * player.mana / player.max_mana, y + 8, 14)
end
