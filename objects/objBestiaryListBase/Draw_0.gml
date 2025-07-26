/// @description drawing
depth = -147
scrViewData()

draw_sprite(sprBestiaryList,0,xview,yview)


draw_set_font(fntMessage)
draw_set_halign(fa_left)
draw_set_color(c_white)


//var _scissor = gpu_get_scissor()
//var box_left = 7
//var box_top = 24
//var box_right = 393
//var box_bottom = 221

//gpu_set_scissor(box_left, box_top, box_right - box_left, box_bottom - box_top)

var menu_x = xview + 64;        // X position of text
var menu_y = yview + 24;        // Y position of top entry

for (var i = 0; i < menu_visible_count; ++i) 
{
    var entry_index = menu_scroll + i;
    if (entry_index >= array_length(entry_list_str)) {
        break;
    }

    var curr_y = menu_y + i * line_height;

    // Draw selector
    if (entry_index == menu_selected) {
        draw_sprite(sprSelector, 0, menu_x - 24, curr_y);
    }

    // Draw text
    draw_text(menu_x, curr_y, entry_list_str[entry_index]);
}

//gpu_set_scissor(_scissor)
