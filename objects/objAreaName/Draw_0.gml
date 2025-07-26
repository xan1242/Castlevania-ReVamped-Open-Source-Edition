/// @description
scrViewData()

var text_x = xview + (wview / 2) + text_base_x
var text_y = yview + text_base_y

var bar_x = xview + (wview / 2) + bar_base_x
var bar_y = yview + bar_base_y
var bar_xsize = wview

draw_rectangle_center_origin(bar_x, bar_y, 1.0, bar_height, bar_xsize, bar_base_ysize, c_black, false)

draw_set_color(c_white)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fntHUD)

if bar_height >= 1.0
	draw_text(text_x, text_y, text)
	
draw_set_valign(fa_top)