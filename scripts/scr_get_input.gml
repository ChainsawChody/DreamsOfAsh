///scr_get_input
up_key = keyboard_check(ord('W'));
left_key = keyboard_check(ord('A'));
down_key = keyboard_check(ord('S'));
right_key = keyboard_check(ord('D'));

dash_key = keyboard_check_pressed(ord('C')); // * to be removed, replaced by sprint
sprint_key = keyboard_check(vk_lshift); //ord('C')
attack_key = keyboard_check_pressed(vk_space); //ord('X')
interact_key = keyboard_check_pressed(ord('E'));
spell_key = keyboard_check_pressed(ord('X'));
swap_key = keyboard_check_pressed(ord('E'));
sneak_key = keyboard_check(vk_lcontrol);
use_key = keyboard_check_pressed(ord('Q'));
cat_key = keyboard_check_pressed(ord('V'));
light_key = keyboard_check_pressed(ord('R')); //make for controller

pause_key = keyboard_check_pressed(vk_escape);

// Get the axis
xaxis = (right_key - left_key);
yaxis = (down_key - up_key);

// Check for gamepad input
if (gamepad_is_connected(0))
{
    gamepad_set_axis_deadzone(0, .35);
    xaxis = gamepad_axis_value(0, gp_axislh);
    yaxis = gamepad_axis_value(0, gp_axislv);
    
    dash_key = gamepad_button_check_pressed(0, gp_shoulderlb);
    sprint_key = gamepad_button_check(0, gp_shoulderr);
    attack_key = gamepad_button_check_pressed(0, gp_face3);
    interact_key = gamepad_button_check_pressed(0, gp_face1);
    spell_key = gamepad_button_check_pressed(0, gp_shoulderrb);
    swap_key = gamepad_button_check_pressed(0, gp_face1);
    sneak_key = gamepad_button_check(0, gp_shoulderl);
    use_key = gamepad_button_check_pressed(0, gp_face4);
    cat_key = gamepad_button_check_pressed(0, gp_face2);
  
    pause_key = gamepad_button_check_pressed(0, gp_start);

}
