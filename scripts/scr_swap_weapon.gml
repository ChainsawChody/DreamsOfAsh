///scr_swap_weapons(new_weapon)

var old_weapon = obj_player_stats.attack //subtesting

var new_weapon = argument0;
var temp = weapon_sprite;

weapon_sprite = new_weapon.sprite_index;
new_weapon.sprite_index = temp;

/*
//Change lantern attack value
if(argument0 == obj_lantern)
{
    new_weapon.sprite_index = spr_lanternweapon;
}

