
particles = {}

function update_particles()
    local alive_particles = {}
    for particle in all(particles) do
        -- minus since weight pulls particles down
        particle.vel.z = particle.vel.z - particle.w 
        particle.pos.x = particle.pos.x + particle.vel.x
        particle.pos.y = particle.pos.y + particle.vel.y
        particle.pos.z = particle.pos.z + particle.vel.z
        if particle.pos.z < 0 then -- bounce
            particle.pos.z = -particle.pos.z
            particle.vel.z = -particle.vel.z * .6
            particle.vel.x = particle.vel.x * .8
            particle.vel.y = particle.vel.y * .8
        end
        particle.l = particle.l - 1
        if particle.l > 0 then
            -- copying is cheap (I hope 😅)
            add(alive_particles, particle)
        end
    end
    particles = alive_particles
end

function draw_particles()
    for particle in all(particles) do
        local x = particle.pos.x
        local y = particle.pos.y - particle.pos.z
        line(x-1, y, x+1, y, particle.c)
        line(x, y - 1, x, y + 1, particle.c)
    end
end

function add_particle(x, y, z, vx, vy, vz, w, l, c)
    add(particles, {
        pos={x=x,y=y,z=z},
        vel={x=vx, y=vy, z=vz},
        w=w,
        l=l,c=c
    })
end