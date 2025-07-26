if (!INPUT_ON_MOBILE)
{
	instance_destroy()
	exit
}

depth = -199
is_touch = InputPlayerGetDevice() == INPUT_TOUCH

function draw_touch_button(subimg, bIsActive, _x, _y)
{
	if (bIsActive)
		draw_set_alpha(1.0)
	else
		draw_set_alpha(0.5)
	
	draw_sprite(sprTouchButtons, subimg, _x, _y);
}

function draw_touch_dpad()
{
	var _oldalpha = draw_get_alpha()
	
	draw_set_alpha(0.5)
	draw_sprite(sprTouchDPad, 0, pos_dpad_x1, pos_dpad_y1);
	
	draw_set_alpha(1.0)
	
	if (InputCheck(INPUT_VERB.UP))
		draw_sprite(sprTouchDPad, 1, pos_dpad_x1, pos_dpad_y1);
	if (InputCheck(INPUT_VERB.DOWN))
		draw_sprite(sprTouchDPad, 2, pos_dpad_x1, pos_dpad_y1);
	if (InputCheck(INPUT_VERB.LEFT))
		draw_sprite(sprTouchDPad, 3, pos_dpad_x1, pos_dpad_y1);
	if (InputCheck(INPUT_VERB.RIGHT))
		draw_sprite(sprTouchDPad, 4, pos_dpad_x1, pos_dpad_y1);
		
	draw_set_alpha(_oldalpha)
}

function draw_touch_start_select()
{
	var _oldalpha = draw_get_alpha()
	
	if (InputCheck(INPUT_VERB.MAP))
		draw_set_alpha(1.0)
	else
		draw_set_alpha(0.5)
	draw_sprite(sprTouchStartSelect, 0, pos_map_x1 + 7, pos_map_y1);
	
	if (InputCheck(INPUT_VERB.PAUSE))
		draw_set_alpha(1.0)
	else
		draw_set_alpha(0.5)
	draw_sprite(sprTouchStartSelect, 1, pos_pause_x1 + 7, pos_pause_y1);
	
	draw_set_alpha(_oldalpha)
}

//function draw_touch_items_ingame()
//{
//	draw_set_font(fntHUD)
	
//	var map_text = "MAP"
//	var pause_text = "PAUSE"
	
//	var HUD_x = 2
//	var HUD_y = 2
	
//	var _top = HUD_y
//	var _left = HUD_x	
//	var _right = display_get_gui_width();
	
//	var map_txt_x = _right / 2 - 64 - 10 + (20)
//	var map_txt_y = _top + string_height(map_text)
	
//	var pause_txt_x = _right / 2 + 10+ (13)
//	var pause_txt_y = _top + string_height(pause_text)
	
//	draw_set_halign(fa_left)
//	draw_set_valign(fa_top)
//	draw_text_outline(map_txt_x, map_txt_y, c_black, c_white, map_text)
//	draw_text_outline(pause_txt_x, pause_txt_y, c_black, c_white, pause_text)
//}


function draw_touch_items_generic()
{
	var _oldalpha = draw_get_alpha()
	
	draw_touch_button(0, InputCheck(INPUT_VERB.ACCEPT), pos_accept_x, pos_accept_y)
	draw_touch_button(1, InputCheck(INPUT_VERB.CANCEL), pos_cancel_x, pos_cancel_y)
	draw_touch_button(2, InputCheck(INPUT_VERB.DASH), pos_dash_x, pos_dash_y)
	draw_touch_button(3, InputCheck(INPUT_VERB.SUBWEAPON), pos_subweapon_x, pos_subweapon_y)
	draw_touch_button(4, InputCheck(INPUT_VERB.SWAP), pos_swap_x, pos_swap_y)
	draw_touch_button(5, InputCheck(INPUT_VERB.AIMLOCK), pos_aimlock_x, pos_aimlock_y)
	
	draw_set_alpha(_oldalpha)
}

//Treat the bottom of the GUI as a reference point
var _right = display_get_gui_width();
var _bottom = display_get_gui_height();

var radius = 24
var button_spacing = 4
var button_edge_offset = 10
pos_accept_x = _right - radius - button_edge_offset
pos_accept_y = _bottom - radius - button_edge_offset
pos_cancel_x = pos_accept_x - radius * 2 - button_spacing
pos_cancel_y = pos_accept_y
pos_dash_x = pos_accept_x
pos_dash_y = pos_accept_y - radius * 2 - button_spacing
pos_subweapon_x = pos_cancel_x
pos_subweapon_y = pos_cancel_y - radius * 2 - button_spacing
pos_aimlock_x = pos_dash_x
pos_aimlock_y = pos_dash_y - radius * 2 - button_spacing
pos_swap_x = pos_aimlock_x - radius * 2 - button_spacing
pos_swap_y = pos_aimlock_y 


size_dpad_x = 128
size_dpad_y = 128

pos_dpad_x = 10
pos_dpad_y = 8

pos_dpad_x1 = pos_dpad_x
pos_dpad_y1 = _bottom - size_dpad_y - pos_dpad_y
pos_dpad_x2 = pos_dpad_x1 + size_dpad_x
pos_dpad_y2 = pos_dpad_y1 + size_dpad_y

//pos_dpad_center_x = (pos_dpad_x2 - pos_dpad_x1) / 2
//pos_dpad_center_y = (pos_dpad_y2 - pos_dpad_y1) / 2

pos_pause_x1 = _right / 2 + 10
pos_pause_y1 = 0
pos_pause_x2 = _right / 2 + 10 + 64
pos_pause_y2 = 32

pos_map_x1 = _right / 2 - 64 - 10
pos_map_y1 = 0
pos_map_x2 = _right / 2 - 10
pos_map_y2 = 32

pos_debug_x1 = 0
pos_debug_y1 = 0
pos_debug_x2 = 32
pos_debug_y2 = 32

global.vbutton_accept = InputVirtualCreate().Circle(pos_accept_x, pos_accept_y, radius).Button(INPUT_VERB.ACCEPT);
global.vbutton_cancel = InputVirtualCreate().Circle(pos_cancel_x, pos_cancel_y, radius).Button(INPUT_VERB.CANCEL);
global.vbutton_subweapon = InputVirtualCreate().Circle(pos_subweapon_x, pos_subweapon_y, radius).Button(INPUT_VERB.SUBWEAPON);

global.vbutton_dash = InputVirtualCreate().Circle(pos_dash_x, pos_dash_y, radius).Button(INPUT_VERB.DASH);
global.vbutton_aimlock = InputVirtualCreate().Circle(pos_aimlock_x, pos_aimlock_y, radius).Button(INPUT_VERB.AIMLOCK);
global.vbutton_swap = InputVirtualCreate().Circle(pos_swap_x, pos_swap_y, radius).Button(INPUT_VERB.SWAP);


global.vbutton_pause = InputVirtualCreate().Rectangle(pos_pause_x1, pos_pause_y1, pos_pause_x2, pos_pause_y2).Button(INPUT_VERB.PAUSE);
global.vbutton_map = InputVirtualCreate().Rectangle(pos_map_x1, pos_map_y1, pos_map_x2, pos_map_y2).Button(INPUT_VERB.MAP);

global.vbutton_debug = InputVirtualCreate().Rectangle(pos_debug_x1, pos_debug_y1, pos_debug_x2, pos_debug_y2).Button(99);

global.vbuttonDPad = InputVirtualCreate()
              .Rectangle(pos_dpad_x1, pos_dpad_y1, pos_dpad_x2, pos_dpad_y2)
              .DPad(undefined, INPUT_VERB.LEFT, INPUT_VERB.RIGHT, INPUT_VERB.UP, INPUT_VERB.DOWN, false);
