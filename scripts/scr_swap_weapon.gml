///scr_swap_weapons(new_weapon)

var new_weapon = argument0;
var temp = weapon_sprite;

weapon_sprite = new_weapon.sprite_index;
new_weapon.sprite_index = temp;

// ---------------------------------------------------
// Change Player's Attack Value by Weapon Held - TEST
// ---------------------------------------------------
// 042 = Lantern
// 147 = Stick
// 149 = Axe
// 150 = Chainsaw

var oldDM = damageModifier;
show_debug_message("oldDM: " + string(damageModifier));

if(obj_player.weapon_sprite == 42) damageModifier = 1;
if(obj_player.weapon_sprite == 147) damageModifier = 1.2;
if(obj_player.weapon_sprite == 149) damageModifier = 1.3;
if(obj_player.weapon_sprite == 150) damageModifier = 1.5;

obj_player_stats.attack = (obj_player_stats.attack / oldDM) * damageModifier;

show_debug_message("damageModifier: " + string(damageModifier));
show_debug_message("attack: " + string(obj_player_stats.attack));


/*
//Change lantern attack value
if(argument0 == obj_lantern)
{
    new_weapon.sprite_index = spr_lanternweapon;
}

