///scr_attack_state
if (obj_player.weapon_sprite = 042) { //lantern 
  image_speed = 0.8;
} else if (obj_player.weapon_sprite = 147) { //stick 
  image_speed = 1.0;
} else if (obj_player.weapon_sprite = 149) { //axe 
  image_speed = 0.5;
} else if (obj_player.weapon_sprite = 150) { //chainsaw 
  image_speed = 0.4;
} else {
  image_speed = 0.8;
}

movement = ATTACK;

if (animation_hit_frame(2))
{
    var attack_animation = instance_create(x, y, obj_weapon_animation);
    attack_animation.dir = face*90;
    attack_animation.image_angle = (face*90) + 45;
    attack_animation.sprite_index = weapon_sprite;
}

if (animation_hit_frame(3))
{
    var xx = 0;
    var yy = 0;
    switch (face)
    {
        case DOWN:
            xx = x;
            yy = y + 12;
            break;
            
        case UP:
            xx = x;
            yy = y - 14;
            break;
            
        case RIGHT:
            xx = x + 10;
            yy = y + 2;
            break;
            
        case LEFT:
            xx = x - 10;
            yy = y + 2;
            break;
    }  
    
    //audio_play_sound(snd_chainsawcut, 1, false);      
    var damage = instance_create(xx, yy, obj_damage);
    damage.creator = id;
    damage.damage = obj_player_stats.attack;
}
