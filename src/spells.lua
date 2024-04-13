
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

function draw_spells()
    local x = 1
    for spell in all(spells) do
        spr(spell.sprite, x, 128 - 9)
        x = x + 9
    end
end
