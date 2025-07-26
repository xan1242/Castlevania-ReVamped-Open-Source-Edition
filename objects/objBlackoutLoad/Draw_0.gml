/// @description cover everything
depth = -147

scrViewData()
var currColor = draw_get_color()
draw_set_color(c_black)
draw_rectangle(xview, yview, xview + wview, yview + hview, false)
draw_set_color(currColor)

//draw_sprite_tiled(sprite_index,0,0,0)