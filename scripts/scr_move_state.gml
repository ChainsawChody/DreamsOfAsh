///scr_move_state
//movement = MOVE;

// -----------------------------
// Tile Sound Test -------------
// -----------------------------

if (obj_input.up_key or obj_input.down_key or obj_input.left_key or obj_input.right_key) {
  //'Move' Sound Properties
  if (movement == MOVE) && (image_index == 1 or image_index == 3) {
    audio_sound_gain(snd_stepgravel, .3, 0);
    var altersoundMove = snd_stepgravel;
    audio_sound_pitch(altersoundMove, random_range(0.9, 1.1));
    audio_play_sound(altersoundMove, 1, false);
  }
  //Sprint Sound Properties
  if (movement == SPRINT) && (image_index == 2 or image_index == 5) {
    audio_sound_gain(snd_stepgravel, .5, 0);
    var altersoundSprint = snd_stepgravel;
    audio_sound_pitch(altersoundSprint, random_range(0.9, 1.1));
    audio_play_sound(altersoundSprint, 1, false);
  }
  //Sneak Sound Properties
  if (movement == SNEAK) && (image_index == 1 or image_index == 3) {
    audio_sound_gain(snd_stepgravel, .2, 0);
    var altersoundSneak = snd_stepgravel;
    audio_sound_pitch(altersoundSneak, random_range(0.9, 1.1));
    audio_play_sound(altersoundSneak, 1, false);
  }

  //movement = MOVE;

}

// -----------------------------
// Movement Mechanic -----------
// -----------------------------

//Check if walking and sprint key
if (obj_input.sprint_key) && (obj_input.up_key or obj_input.left_key or obj_input.down_key or obj_input.right_key or(obj_input.xaxis or - obj_input.xaxis or obj_input.yaxis or - obj_input.yaxis)) {
  movement = SPRINT;
  sprinting = true
}

if (sprinting == true && obj_player_stats.stamina >= 0) {
  // increase maximum speed
  spd = spdsprint;
  obj_player_stats.stamina -= .025;
  //play step sound

} else {
  // set sprint speed back to default
  spd = spdwalk;
  movement = MOVE;
}

if (speed == 0) {
  // player stopped moving
  sprinting = false
}

// Regen stamina when not sprinting
if (!obj_input.sprint_key) {
  if (obj_player_stats.stamina < obj_player_stats.maxstamina) {
    obj_player_stats.stamina += (obj_player_stats.maxstamina * .005) //.05;
  } else {
    obj_player_stats.stamina = obj_player_stats.maxstamina
  }
}

//Sneak key
if (obj_input.sneak_key) && (obj_input.up_key or obj_input.left_key or obj_input.down_key or obj_input.right_key or(obj_input.xaxis or - obj_input.xaxis or obj_input.yaxis or - obj_input.yaxis)) {
  spd = spdsneak;
  movement = SNEAK;
}


// -----------------------------
// Action States ---------------
// -----------------------------

// Dash Key
if (obj_input.dash_key) && obj_player_stats.stamina >= DASH_COST {
  var xdir = lengthdir_x(8, face * 90);
  var ydir = lengthdir_y(8, face * 90);

  // Dash
  state = scr_dash_state;
  alarm[0] = room_speed / 8;
  obj_player_stats.stamina -= DASH_COST;
  obj_player_stats.alarm[0] = room_speed;
}

// Attack Key
// 042 = Lantern
// 147 = Stick
// 149 = Axe
// 150 = Chainsaw
if (obj_input.attack_key) && obj_player_stats.stamina >= 0 {
  image_index = 0;
  obj_player_stats.stamina -= 1;
  state = scr_attack_state;

  //Swing Sounds
  if (!audio_is_playing(snd_swing)) {
    if (obj_player.weapon_sprite = 042) { //lantern swing
      var altersoundAttack = snd_swing;
      audio_sound_pitch(altersoundAttack, random_range(0.95, 1.05));
      audio_play_sound(altersoundAttack, 1, false);
    } else if (obj_player.weapon_sprite = 147) { //stick swing
      var altersoundAttack = snd_swing;
      audio_sound_pitch(altersoundAttack, random_range(1.3, 1.4));
      audio_play_sound(altersoundAttack, 1, false);
    } else if (obj_player.weapon_sprite = 149) { //axe swing
      var altersoundAttack = snd_swing;
      audio_sound_pitch(altersoundAttack, random_range(0.8, 0.9));
      audio_play_sound(altersoundAttack, 1, false);
    } else if (obj_player.weapon_sprite = 150) { //chainsaw swing
      var altersoundAttack = snd_chainsawswing;
      audio_sound_pitch(altersoundAttack, random_range(0.95, 1.05));
      audio_play_sound(altersoundAttack, 1, false);
    } else {
      var altersoundAttack = snd_swing;
      audio_sound_pitch(altersoundAttack, random_range(0.9, 1.1));
      audio_play_sound(altersoundAttack, 1, false);
    }
  }
}

// Boomstick Key
if (obj_input.spell_key) && obj_player_stats.playerammo >= 1 {
  image_index = 0;
  state = scr_boom_state; //currently bugged out
  
  //play boomstick sound
  if (!audio_is_playing(snd_boomstick)) {
    var altersoundSpell = snd_boomstick;
    audio_sound_pitch(altersoundSpell, random_range(0.9, 1.1));
    audio_play_sound(altersoundSpell, 1, false);

    //create projectile
    var p = instance_create(x, y, obj_projectile);
    //Decrease ammo according to shots fired
    obj_player_stats.playerammo -= 1; //(instance_number(obj_projectile));
    var xforce = lengthdir_x(2, face * 90); //(20, face*90);
    var yforce = lengthdir_y(2, face * 90);
    p.creator = id;
    with(p) {
      physics_apply_impulse(x, y, xforce, yforce);
    }
  }
}

// Interact Key
scr_interact();

//Swap key
if (obj_input.swap_key) {
  var nearest_weapon = instance_nearest(x, y, (obj_weapon_item));
  if (place_meeting(x, y + 4, nearest_weapon)) {
    //var lanternweapon = weapon_sprite;
    scr_swap_weapon(nearest_weapon);
  }
}

//Eat key
//Check key and parameters
if (obj_input.use_key) && (obj_player_stats.ediblemeat >= 1) // && ((obj_player_stats.hp != obj_player_stats.maxhp) or (obj_player_stats.stamina != obj_player_stats.maxstamina))
{
  //Check if health/stam are NOT maxed
  if (obj_player_stats.hp != obj_player_stats.maxhp) or(obj_player_stats.stamina != obj_player_stats.maxstamina) {
    //Subtract meat and play sound
    obj_player_stats.ediblemeat -= 1;
    if (!audio_is_playing(snd_playereat)) {
      var altersoundEat = snd_playereat
      audio_sound_pitch(altersoundEat, random_range(0.9, 1.1));
      audio_play_sound(altersoundEat, 1, false);
    }
  }
  //------------
  //Health up
  if (obj_player_stats.hp + obj_ediblemeat.healthup <= obj_player_stats.maxhp) {
    obj_player_stats.hp += obj_ediblemeat.healthup;
  } else { //Set to max
    obj_player_stats.hp = obj_player_stats.maxhp;
  }
  //------------
  //Stamina up
  if (obj_player_stats.stamina + obj_ediblemeat.staminaup <= obj_player_stats.maxstamina) {
    obj_player_stats.stamina += obj_ediblemeat.staminaup;
  } else { //Set to max
    obj_player_stats.stamina = obj_player_stats.maxstamina;
  }
  //------------
}

//Summon Cat
//Create cat with monster eye
if (obj_input.cat_key) && (obj_player_stats.eyes >= 1) && (obj_player_stats.hp != obj_player_stats.maxhp) {
  if (instance_exists(obj_blackcat)) {
    //Do nothing
  } else {
    obj_player_stats.eyes -= 1;
    scr_blackcat();
  }
}

//----------------------------------------------------------------------------------------------------------------

// Get direction
dir = point_direction(0, 0, obj_input.xaxis, obj_input.yaxis);

//Get length
if (obj_input.xaxis == 0 && obj_input.yaxis == 0) {
  len = 0;
} else {
  len = spd;
  scr_get_face(dir);
}

// Get the hspd and vspd
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

//Move
phy_position_x += hspd;
phy_position_y += vspd;

// Control the sprites
image_speed = sign(len) * .2;
if (len == 0) image_index = 0;


/*

// Control vertical sprites
if (vspd > 0)
{
    sprite_index = spr_playerDown;
} else if (vspd < 0) {
    sprite_index = spr_playerUp;
}

// Control horizantal sprites
if (hspd > 0)
{
    sprite_index = spr_playerRight;
} else if (hspd < 0) {
    sprite_index = spr_playerLeft;
}
*/
