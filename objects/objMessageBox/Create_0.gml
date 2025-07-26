/// @description setup
//scrViewData()
depth = -147

box_xscale = 0
shrink = false
waiting = 30

application_surface_enable(true);
screen_sprite = sprite_create_from_surface(application_surface, 0, 0, 400, 224, false, false, 0, 0);
text = global.message_box
//text_height = get_text_height(fntMessage, text)
text_height = get_text_height_scribble_wrap(fntMessage, text, 384)

var font_leading_adjust = 1
var box_ypadding = 4

text_base_x = 0
text_base_y = -48

box_base_x = text_base_x
box_base_y = text_base_y + font_leading_adjust - (box_ypadding / 2)
box_ysize = text_height + box_ypadding
