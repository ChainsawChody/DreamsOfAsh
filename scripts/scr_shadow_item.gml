///scr_draw_shadow
//Draw shadow
xshade = -1;
yshade = -1;
salpha = 0.1;

xshadow = x + xshade;
yshadow = y + yshade;
draw_sprite_ext(sprite_index, 0, xshadow, yshadow, 1, 1, 0, c_black, salpha);
draw_self();
