///scr_lanter_on();
size = 250 + glowSize;
var x1 = (x - size / 2 - view_xview)
var y1 = (y - size / 2 - view_yview)
var x2 = (x + size / 2 - view_xview)
var y2 = (y + size / 2 - view_yview) 
draw_set_blend_mode(bm_subtract);
surface_set_target(light);
draw_ellipse_color(x1, y1, x2, y2, lanterncolor, c_black, false);
surface_reset_target();
draw_set_blend_mode(bm_normal);

//size = 125;
draw_set_blend_mode(bm_subtract);
surface_set_target(light);
draw_ellipse_color(x1, y1, x2, y2, playercolor, c_black, false);
surface_reset_target();
draw_set_blend_mode(bm_normal);
//instance_destroy(obj_lantern);
lightOn = true;
lightOff = false;
