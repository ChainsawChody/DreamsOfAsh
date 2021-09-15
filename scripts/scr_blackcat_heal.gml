//Heal player
if(obj_player_stats.hp <= obj_player_stats.maxhp && jobdone == false)
{
    sprite_index = spr_blackcat_sitting;
    obj_player_stats.hp += .05;
}
else
{
    //Once player reaches full health destroy
    obj_player_stats.hp = obj_player_stats.maxhp;
    jobdone = true;
    if(obj_player_stats.hp == obj_player_stats.maxhp)
    {
            sprite_index = spr_blackcat_fade; //spr_blackcat_walking
            phy_position_y -= .5;
            image_alpha -= .05;
            if(image_alpha <= 0)
            {
                instance_destroy();
            }         
    }
}
