events = {}

function update_events()
    for event in all(events) do
        if event.type == "monster_died" then
            monster_died_event(event)
        else
            stop("unknown event type")
        end
    end
    events = {}
end

function weight(element)
    if element == "water" then
        return .05
    elseif element == "earth" then
        return .1
    elseif element == "fire" then
        return -.05
    else
        stop("unknown element")
    end
end

function monster_died_event(event)
    local tx = event.monster.pos.x
    local ty = event.monster.pos.y
    local s = sprites[event.monster.element.."_monster"]
    local base_sy = flr(s / 16) * 8
    local base_sx = (s - base_sy) * 8
    for y = 0, 7 do
        for x = 0, 7 do
            c = sget(base_sx + x, base_sy + y)
            if c == 0 then
                goto continue
            end
            add_particle(
                tx + x,
                ty + y,
                y,
                rnd(1.5) - .75, -- vx
                rnd(1.5) - .75, -- vy
                rnd(1),   -- vz
                weight(event.monster.element),
                20 + rnd(5),
                c
            )
            ::continue::
        end
    end
end
