//global.inputController.vbutton_accept.debug_draw()

if (!is_touch)
	exit

var _oldcolor = draw_get_color()
var _oldalpha = draw_get_alpha()

draw_set_color(c_white)

draw_touch_dpad()
draw_touch_items_generic()
//if (instance_find(objGame, 0))
//	draw_touch_items_ingame()
//else
	draw_touch_start_select()
	
draw_set_color(c_white)
//InputVirtualDebugDraw()

draw_set_color(_oldcolor)
draw_set_alpha(_oldalpha)

//show_debug_message("Overlay layer: " + string(global.TouchOverlayLayer))
//show_debug_message(string(layer_get_id_at_depth(-199)))