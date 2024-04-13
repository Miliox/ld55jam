
spells = {
    {
        sprite = sprites.summon1,
        func = function(caster)
            add_monster({x=caster.pos.x, y=caster.pos.y}, {v=0.5})
        end,
        cost = 1
    },
    {
        sprite = sprites.summon2,
        func = function(caster)
            add_monster(caster.pos, {v=0.5})
        end,
        cost = 2
    }
}

function draw_gui()
    local x = 1
    for spell in all(spells) do
        spr(spell.sprite, x, 128 - 9)
        x = x + 9
    end
    local x = (player.selected_spell - 1) * 9
    local y = 128 - 10
    rect(x, y, x + 9, y + 9, 14)
end
