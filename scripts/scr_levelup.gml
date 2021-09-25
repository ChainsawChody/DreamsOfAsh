///scr_levelup
with(obj_player_stats) {
  expr += other.expr;
  if (expr >= maxexpr) {
    //Level up notification
    //draw_text_colour(obj_player.x - 32, obj_player.y - 15, "Level up!", c_white, c_white, c_white, c_white, image_alpha)
    level += 1;
    expr = expr - maxexpr;
    maxexpr += maxexpr;
    hp = maxhp;
    maxhp += (5 + irandom(2));
    stamina += maxstamina;
    maxstamina += (5 + irandom(2));
    attack += 0.1; //+= .5
    if (!audio_is_playing(snd_levelup)) {
      audio_play_sound(snd_levelup, 1, false)
    }
    instance_create(x, y, obj_levelup)
  }
}
