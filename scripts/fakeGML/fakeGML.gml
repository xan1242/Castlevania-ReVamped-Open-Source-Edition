function instance_create(inst_x, inst_y, instance)
{
	instance_create_depth(argument0,argument1,0,argument2)
}

function scrViewData()
{/// @function scrViewData();
	xview = camera_get_view_x(view_camera)
	yview = camera_get_view_y(view_camera)
	wview = camera_get_view_width(view_camera)
	hview = camera_get_view_height(view_camera)
	windowscale = 1 //ds_map_find_value(global.options,"windowscale")
}

function frame_count()
{
	return ( sprite_get_number(sprite_index) - 1 );
}

function sprite_set(sprite, img_speed)
{
	sprite_index = argument0
	image_speed = argument1
}

function nes_colors()
{
	nes_red = make_color_rgb(219,44,1)
	nes_yellow = make_color_rgb(242,191,63)
	nes_blue = make_color_rgb(0,116,237)
	nes_green = make_color_rgb(0,169,2)
}

//function draw_text_outline_cached(text_str, outline_col, text_col, font, padding)
//{
//	// Create a unique cache key (you can customize this if needed)
//	var key = text_str + "#" + string(outline_col) + "#" + string(text_col) + "#" + string(font);
	
//	if (!variable_global_exists("__text_cache")) {
//		global.__text_cache = ds_map_create();
//	}

//	if (!ds_map_exists(global.__text_cache, key)) {
//		// Set font to measure size
//		draw_set_font(font);
//		var w = string_width(text_str) + padding * 2;
//		var h = string_height(text_str) + padding * 2;

//		var surf = surface_create(w, h);
//		surface_set_target(surf);
//		draw_clear_alpha(c_black, 0);
		
//		// Draw outline
//		draw_set_color(outline_col);
//		for (var ox = -1; ox <= 1; ++ox) {
//			for (var oy = -1; oy <= 1; ++oy) {
//				if (ox != 0 || oy != 0) {
//					draw_text(padding + ox, padding + oy, text_str);
//				}
//			}
//		}

//		// Draw main text
//		draw_set_color(text_col);
//		draw_text(padding, padding, text_str);

//		surface_reset_target();

//		// Cache it
//		ds_map_add(global.__text_cache, key, surf);
//	}

//	return global.__text_cache[? key];
//}

// NOTE: Scribble has HORRIBLE performance! It TANKS the FPS on HUD render! DO NOT USE IT UNLESS YOU REALLY NEED IT!!!
function draw_text_outline(text_x, text_y, outline_col, text_col, text_str, bScribble = false)
{
	var old_col = draw_get_color();
	
	draw_set_color(outline_col);
	
	for (var i = 0; i < global.tex_outline_offset_len; ++i)
	{
		var ox = global.tex_outline_offsets[i][0];
		var oy = global.tex_outline_offsets[i][1];
		if (bScribble)
			draw_text_scribble(text_x + ox, text_y + oy, text_str);
		else
			draw_text(text_x + ox, text_y + oy, text_str);
	}
	
	draw_set_color(text_col);
	if (bScribble)
		draw_text_scribble(text_x, text_y, text_str);
	else
		draw_text(text_x, text_y, text_str);
		
	draw_set_color(old_col);
}

function deactivate()
{
	instance_deactivate_all(true)
	instance_activate_object(__InputUpdateController)
	instance_activate_object(objInputSystem)
	instance_activate_object(objTouchControls)
	instance_activate_object(objCRTFilter)
	instance_activate_object(objSpiciness)
}

function draw_sprite_tiled_area(sprite_id,subimg_id,x_origin,y_origin,x_topleft,y_topleft,x_bottomright,y_bottomright)
{
    var sprite,subimg,xx,yy,x1,y1,x2,y2;
    sprite = argument0;
    subimg = argument1;
    xx = argument2;
    yy = argument3;
    x1 = argument4;
    y1 = argument5;
    x2 = argument6;
    y2 = argument7;
 
    var sw,sh,i,j,jj,left,top,width,height,X,Y;
    sw = sprite_get_width(sprite);
    sh = sprite_get_height(sprite);
 
    i = x1-((x1 mod sw) - (xx mod sw)) - sw*((x1 mod sw)<(xx mod sw));
    j = y1-((y1 mod sh) - (yy mod sh)) - sh*((y1 mod sh)<(yy mod sh)); 
    jj = j;
 
    for(i=i; i<=x2; i+=sw) {
        for(j=j; j<=y2; j+=sh) {
 
            if(i <= x1) left = x1-i;
            else left = 0;
            X = i+left;
 
            if(j <= y1) top = y1-j;
            else top = 0;
            Y = j+top;
 
            if(x2 <= i+sw) width = ((sw)-(i+sw-x2)+1)-left;
            else width = sw-left;
 
            if(y2 <= j+sh) height = ((sh)-(j+sh-y2)+1)-top;
            else height = sh-top;
 
            draw_sprite_part(sprite,subimg,left,top,width,height,X,Y);
        }
        j = jj;
    }
    return 0;
}

function draw_rectangle_center_origin(inX, inY, inXscale, inYscale, inW, inH, inColor, bDoOutline)
{
	var oldColor = draw_get_color()
	
	var xcenter = inX
	var ycenter = inY
	
	var xsize = inW * inXscale
	var ysize = inH * inYscale
	
	var xhalfsize = xsize / 2
	var yhalfsize = ysize / 2
	
	draw_set_color(inColor)
	draw_rectangle(xcenter - xhalfsize, ycenter - yhalfsize, xcenter + xhalfsize, ycenter + yhalfsize, bDoOutline)
	
	draw_set_color(oldColor)
}

///// @function wrap_text(text, max_chars)
///// @param text The input string
///// @param max_chars The maximum number of characters per line
///// @return The wrapped string
//function wrap_text(text, max_chars) {
//    var result = "";
//    var words = string_split(text, " ");
//    var line = "";

//    for (var i = 0; i < array_length(words); i++) {
//        var word = words[i];

//        // Check if adding the word would exceed the max line length
//        if (string_length(line) + string_length(word) + 1 > max_chars) {
//            result += line + "#";
//            line = word;
//        } else {
//            if (string_length(line) > 0) {
//                line += " ";
//            }
//            line += word;
//        }
//    }

//    // Append any remaining line
//    if (string_length(line) > 0) {
//        result += line;
//    }

//    return result;
//}


function get_text_height(inFont, inText)
{
	var oldFont = draw_get_font()
	draw_set_font(inFont)
	
	var ret = string_height(inText)
	
	draw_set_font(oldFont)
	
	return ret
}

//function get_text_height_wrap(inFont, inText, maxChars)
//{
//	var wrappedstr = wrap_text(inText, maxChars)
//	return get_text_height(inFont, wrappedstr)
//}

function get_text_height_scribble_wrap(inFont, inText, maxChars)
{
	var oldFont = draw_get_font()
	draw_set_font(inFont)
	
	var ret = string_height_scribble_ext(inText, maxChars)
	
	draw_set_font(oldFont)
	
	return ret
}

function set_crt_filter(enabled)
{
	var _enabled = enabled // copy, do not reference
	if (_enabled)
	{
		if (instance_number(objCRTFilter) == 0)
		{	
			texturegroup_load("CRTShader", true)
			instance_create(-128,-128,objCRTFilter);
		}
		global.oldtvfilter_enabled = true
	}
	else
	{
		global.oldtvfilter_enabled = false
		with(objCRTFilter) instance_destroy()
		texturegroup_unload("CRTShader")
		gpu_set_tex_filter(false)
	}
	
	surface_resize(application_surface, 400, 224);
	display_set_gui_size(400, 224)
}

function ds_list_to_array(_list)
{
	var size = ds_list_size(_list)
	var retVal = array_create(size)
	for (var i = 0; i < size; i++)
	{
		retVal[i] = _list[| i];
	}
	
	return retVal;
}

function ds_map_to_struct(_map)
{
	var my_struct = {};
	var key_list = ds_map_keys_to_array(_map);

	for (var i = 0; i < array_length(key_list); i++)
	{
	    var key = key_list[i];
	    my_struct[$ key] = ds_list_to_array(_map[? key]);
	}
	
	return my_struct;
}

function title_screen()
{
	//if global.savedata != undefined
	//	ds_map_destroy(global.savedata)
	
	
	gameplay_unload()
	room_goto(rmPostInit)
}

//function init_outline_fnt_message()
//{
//	/// Generate pixel-art outline font from small fnt_main (6pt)
//	var chars = "";
//	for (var i = 32; i <= 126; i++) chars += chr(i);

//	var char_count = string_length(chars);
//	var char_size = 16; // Small pixel-art font, tight fit
//	var surf = surface_create(char_size, char_size);

//	var spr_outline = sprite_create_empty(char_count, char_size, char_size);

//	for (var i = 1; i <= char_count; i++) {
//	    var c = string_char_at(global.chars, i);

//	    surface_set_target(surf);
//	    draw_clear_alpha(c_black, 0);
//	    draw_set_font(global.fnt_main);
//	    draw_set_color(c_white);

//	    // 1px outline in 4 directions (better for pixel fonts)
//	    draw_text(1, 0, c); // Right
//	    draw_text(-1, 0, c); // Left
//	    draw_text(0, 1, c); // Down
//	    draw_text(0, -1, c); // Up

//	    draw_text(0, 0, c); // Center (fill)

//	    surface_reset_target();

//	    sprite_add_from_surface(spr_outline, surf, 0, 0, char_size, char_size, true, false);
//	}

//	global.fnt_outline = font_add_sprite(spr_outline, ord(" "), true, 0);
//	surface_free(surf);

//}