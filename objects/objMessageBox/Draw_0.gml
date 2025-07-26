/// @description draw the box, dummy!
scrViewData()
draw_sprite_ext(screen_sprite,0,xview,yview,1/windowscale,1/windowscale,0,c_white,1) //draw_sprite_ext(screen_sprite,0,xview,yview,wview/view_wport[0],hview/view_hport,0,c_white,1)

var text_x = xview + (wview/2) + text_base_x;
var text_y = yview + (hview/2) + text_base_y;
var box_x = xview + (wview/2) + box_base_x
var box_y = yview + (hview/2) + box_base_y
var box_xsize = wview

draw_rectangle_center_origin(box_x, box_y, box_xscale, 1.0, box_xsize, box_ysize, c_black, false)

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fntMessage)
draw_set_color(c_white)

if box_xscale >= 1.0
	draw_text_scribble_ext(text_x, text_y, text, 384)

//reset valign for other objects!
draw_set_valign(fa_top)

