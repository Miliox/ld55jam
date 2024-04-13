pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

#include src/constants.lua
#include src/math2d.lua
#include src/monsters.lua
#include src/spells.lua
#include src/player.lua

function _init()
    add_monster({x=12, y=12}, {v=0.5})
    add_monster({x=112, y=112}, {v=0.5})
    add_monster({x=112, y=112}, {v=0.5})
end

function _update()
    update_monsters()
    update_player()
end

function _draw()
    cls()
    draw_monsters()
    draw_spells()
    draw_player()
end

__gfx__
000000000000000000000000000000000000000000000000000000000000000000000000000000007007c0077007c0070000aa00000000000000000000000000
0000000033003008000000000000000000000000000000000000000000000000000000000000000007cc0c7007cc0c7000000aa0000000000000000000000000
007007000333300300000000000000000000000000000000000000000000000000000000000000000c0008c00caaa1c000000a90000000000000000000000000
000770000033073300000000000000000000000000000000000000000000000000000000000000007c03300c7c0aa10c00000a90000000000000000000000000
00077000033333000000000000000000000000000000000000000000000000000000000000000000c03330c7c0aaa0c7aa00aa90000000000000000000000000
007007003333300000000000000000000000000000000000000000000000000000000000000000000c0030c00caa0ac00aaaa990000000000000000000000000
0000000000033000000000000000000000000000000000000000000000000000000000000000000007c0cc7007c0cc7000999900000000000000000000000000
00000000000333000000000000000000000000000000000000000000000000000000000000000000700c7007700c700700000000000000000000000000000000
