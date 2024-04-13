sprites = {
    summon1 = 10,
    summon2 = 11,
}

spells = {
    {
        sprite = sprites.summon1,
        func = function(caster)
            add_monster(caster.pos)
        end
    },
    {
        sprite = sprites.summon2,
        func = function(caster)
            add_monster(caster.pos)
        end
    }
}

function draw_spells()
    local x = 1
    for spell in all(spells) do
        spr(spell.sprite, x, 128 - 9)
        x = x + 9
    end
end
