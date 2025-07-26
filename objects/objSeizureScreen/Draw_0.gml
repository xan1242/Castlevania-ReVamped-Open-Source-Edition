/// @description do it
scrViewData()

draw_set_color(c_black)
draw_rectangle(xview, yview, xview + wview, yview + hview, false)

draw_set_halign(fa_center)
draw_set_valign(fa_middle)

draw_set_font(fawnt)

draw_set_color(c_white)

draw_text_ext(200,112,seizure_message,10,400 - 48)


draw_set_halign(fa_left)
draw_set_valign(fa_top)