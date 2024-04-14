pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

#include src/util.lua
#include src/constants.lua
#include src/math2d.lua
#include src/monsters.lua
#include src/spells.lua
#include src/player.lua
#include src/enemy.lua

function _init()
    init_player()
    init_enemy()
    music(0)
end

function _update()
    if player.health == 0 or enemy.health == 0 then
        return
    end
    update_monsters()
    update_player()
    update_enemy()
end

function _draw()
    cls()
    map()
    draw_monsters()
    draw_gui()
    draw_player()
    draw_enemy()
end

__gfx__
000000000800080000000c00000000000000000000000000000000000000000000000000068000007007c0077033b0000000aa00080008000000000000000000
000000008988a8080cc5cc5c3300300800000000000000000000000000000000000000009888888707cc0c7077bb377000000aa0088008000000000000000000
0070070030999989c511ddc0033330030000000000000000000000000000000000000000098000000c0008c070b3307000000a90088888800000000000000000
000770000a8ac71211c5c170003307330000000000000000000000000000000000000000009000007c03300c7000007700000a90080000800000000000000000
000770000aac3220c5dcc50003333300000000000000000000000000000000000000000000000700c03330c7cc000070aa00aa90800a5a080000000000000000
0070070003cc2222111c11c033333000000000000000000000000000000000000000000000000c600c0030c011000a890aaaa990800000080000000000000000
0000000000222222c11111cc00033000000000000000000000000000000000000000000007ccccc107c0cc701177799000999900080000800000000000000000
00000000006000060100010000033300000000000000000000000000000000000000000000000c10700c7007c10708a800000000088888800000000000000000
000000000000000000000000000000000000000000000000000000000000000000089009000cc000000bbb00000069000000600000006c000000000000000000
000000000000000000000000000000000000000000000000000000000000000090998a0000ccc00000344b00000659000006560000065d000000000000000000
00000000000000000000000000000000000000000000000000000000000000000988889a00c1ccc003355330006595990065c5600065b5dc0000000000000000
00000000000000000000000000000000000000000000000000000000000000008989898a1c1c1cc1b4b33454000655580006555c000653bb0000000000000000
00000000000000000000000000000000000000000000000000000000000000008888888ac111c111b45335b400046980000469d0000463300000000000000000
0000000000000000000000000000000000000000000000000000000000000000008888000101c1110344b3000040080000400d0c004003000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000880000cccc010005433000400000004000cc0040000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000a008800acc0cc00000333000400000004000c00c400000000000000000000000
444444444444444411111111ffffffffffffffffffffffff11111441111101110000000000000000000000000000000000000000000000000000000000000000
494944444444444411111121fffffff1fffffff1ffffffff111144141110111f0000000000000000000000000000000000000000000000000000000000000000
449444444544444411111111ffffff11ffffff11ffa677ff11114144111111ff0000000000000000000000000000000000000000000000000000000000000000
444444444444444411111111fffff110fffff144fff77fff1111144111111fff0000000000000000000000000000000000000000000000000000000000000000
444444444444444411111111ffff1111ffff1441ffff7fff111111111011ffff0000000000000000000000000000000000000000000000000000000000000000
444444444444444411111111fff11111fff14411ffffffff11111111011fffff0000000000000000000000000000000000000000000000000000000000000000
44444444444445441c111111ff111111ff144114ffffffff1111111111ffffff0000000000000000000000000000000000000000000000000000000000000000
444444444444444411111111f1101111f1441144ffffffff111111111fffffff0000000000000000000000000000000000000000000000000000000000000000
444444444444444444444444ffffffff11111111441144411111111144114411ffffffff00000000000000000000000000000000000000000000000000000000
444444444444444444444444ffffffff1111111141144414111111114114411fffffffff00000000000000000000000000000000000000000000000000000000
4444444444425d4445444544ffffffff111111111144414411111111114411ffffffffff00000000000000000000000000000000000000000000000000000000
444444444465554455555255ffffffff11111111144414441111111114411fffffffffff00000000000000000000000000000000000000000000000000000000
4444444444555d6445444544ffffffff1111111144414441144111114411fffffff8fff800000000000000000000000000000000000000000000000000000000
444444444555555452555555ffffffff111111114414441144141111411ffffffff88f8800000000000000000000000000000000000000000000000000000000
444444444d555d5445444544ffffffff11111111414441144144111111fffffffffff8ff00000000000000000000000000000000000000000000000000000000
444444444444444445444544ffffffff1111111114441144144111111fffffffffff8f8f00000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000ffffff1100000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000ffffff1100000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000fffffff100000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000fffffff100000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000fffffff100000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000fffffff100000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000ffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000ffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
3030303030303030303030303030303033383333332334343434343434343434343434340000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3031203030313030302030203030303133332533233434343434343434343434343434340000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3020303030303030303030303020303033333324363434343434343434343434343434340000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3031303030303020313030303031303033332435353634343434343434343434343434340000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3030303030303031303030303030303038243535353536343434343434343434000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3020203030303030312120303030313023263535353535363434343434343434000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3030213030303232323221303030303034342635353535353634343434343434000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3030303030313020303121303020303034343426353535353536343434343434000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3030303031313030303031303030303034343434263535353535363434343434000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3030303230303021302031303030303034343434342635353535353634343434000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3030322021303032222231312130303034343434343426353535353536343434000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3030203030323220222230303030303034343434343434263535353535363427000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3020303020303020223021203030303034343434343434342635353535352738000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3030303030213022223030303030303034343434343434343426353535373333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3131303030302222302030303031303034343434343434343434263537333333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3131302130202230302130303030303034343434343434343434342733333333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3131313030222230303030303030303034343434343434343434272525333333373737370000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4d100010001600e1610e1600e1600c1000e160001000e16015161151600010015160001001516015160001000e1600010015100001001510015100001001a1000010000100001000010000100001000010000100
5910000000200002002226221262212601f261002001f2602426000200242600020024262002002426026260242002226221262212601f2612426100200242600020000200242600020026260002002426026260
6302000035640326402d6402a64026640216401c640166401d6001d6001e6001e6001e6001e6001e6001d6001c6001c6001b6001a6001a6001960018600186001860017600176001660016600156000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011000101ab501ab0018b001ab500cb001ab5000b001ab501ab0000b001ab5000b001ab5000b001ab5000b0000b0000b0000b0000b0000b0000b0000b0000b0000b0000b0000b000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
002000001d95000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 41420a44
00 01420a44
03 01020a44

