
monster_queue = {}

function add_monster(pos)
    add(monster_queue, {pos=pos})
end

function draw_monsters()
    for monster in all(monster_queue) do
        spr(1, monster.pos.x, monster.pos.y)
    end
end