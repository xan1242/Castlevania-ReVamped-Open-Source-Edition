/// @description start or quit
draw_sprite(sprite_index,image_index,x,y)

nes_colors()
draw_set_halign(fa_center)
draw_set_font(fntHUD)

if image_index >= 3
	drawOptions();
	//draw_text_outline(200,160,c_black,nes_red,title_text)
	
draw_set_halign(fa_left)
draw_text(8,224-12, version_string)