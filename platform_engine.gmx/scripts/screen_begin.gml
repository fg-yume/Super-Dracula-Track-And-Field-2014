// this draws the surface on the screen
d3d_set_fog(0,c_black,0,0);

surface_reset_target();
draw_clear(0);
draw_surface_stretched(screen,screen_x,screen_y,screen_w*screen_scale,screen_h*screen_scale);
screen_refresh();

d3d_set_fog(1,c_black,0,oCharacter.brightness);
