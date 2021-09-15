if (obj_input.interact_key)
{
    // Pause all movement
    //scr_dialog_state(); < attempt to freeze sprite movement
        
    var xdir = lengthdir_x(8, face*90);
    var ydir = lengthdir_y(8, face*90);
    var speaker = instance_place(x + xdir, y + ydir, obj_speaker);
    // Talk to it
    with (speaker)
    {
        if(!instance_exists(dialog))
        {
            dialog = instance_create(x + xoffset, y + yoffset, obj_dialog);
            dialog.text = text;
        } 
        else
        {
            dialog.text_page++;
            dialog.text_count = 0;
            //Maybe use below for checking cutscene states?
            if (dialog.text_page > array_length_1d(dialog.text) - 1)
            {
                with (dialog)
                {
                    instance_destroy();
                }
            }
        }
    }
}



/* Backup
if (obj_input.interact_key)
{
    // Pause all movement
    //scr_dialog_state(); < attempt to freeze sprite movement
        
    var xdir = lengthdir_x(8, face*90);
    var ydir = lengthdir_y(8, face*90);
    var speaker = instance_place(x + xdir, y + ydir, obj_speaker);
    // Talk to it
    with (speaker)
    {
        if(!instance_exists(dialog))
        {
            dialog = instance_create(x + xoffset, y + yoffset, obj_dialog);
            dialog.text = text;
        } else
        {
            dialog.text_page++;
            dialog.text_count = 0;
            //Maybe use below for checking cutscene states?
            if (dialog.text_page > array_length_1d(dialog.text) - 1)
            {
                with (dialog)
                {
                    instance_destroy();
                }
            }
        }
    }
}
