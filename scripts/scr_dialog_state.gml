///scr_dialog_state()

if(instance_exists(obj_dialog))
{
    //Save previous speeds

    ptempspd = obj_player.spd;
    etempspd = obj_enemy_pigman.spd;
    
    //Set speeds to 0
    var talkspd = 0; //obj_player.spd
    obj_player.spd = talkspd;
    obj_enemy_pigman.spd = talkspd;

}
else
{
    //Return to normal speeds
    obj_player.spd = ptempspd;
    obj_enemy_pigman.spd = etempspd;
}
