/// @description setup
selection = 0
bitBGM(bgmCastlevania)
instance_create(x,y,objFadeInShutter)
image_speed = 0
version_string = "v1.2.0 - UNOFFICIAL"
title_text = ""
selection_confirmed = false
flicker_state = false

title_option_texts = ["START", "QUIT"]
title_option_texts_selected = ["[ START ]", "[ QUIT ]"]
title_text_height = get_text_height(fntHUD, "X");

selection_count = 2
if (INPUT_ON_MOBILE)
{
	selection_count = 1
	title_option_texts = ["PRESS START BUTTON"]
	title_option_texts_selected = ["[ PRESS START BUTTON ]"]
}

texturegroup_load("TitleScreen")
texturegroup_load("bgTitleGroup")


function drawOptions()
{
	var base_x = 200;
	var base_y = 160;
	var y_padding = 2;
	
	for (var i = 0; i < selection_count; i++)
	{
		var off_y = title_text_height * i;
		if (i != 0)
			off_y += y_padding
		
		if (i == selection)
		{
			if (selection_confirmed)
			{
				if (!flicker_state)
					draw_text_outline(base_x, base_y + off_y, c_black, nes_red, title_option_texts[i])
				flicker_state = !flicker_state;
			}
			else
				draw_text_outline(base_x, base_y + off_y, c_black, nes_red, title_option_texts_selected[i])
		}
		else
			draw_text_outline(base_x, base_y + off_y, c_black, nes_red, title_option_texts[i])
	}
	
}
