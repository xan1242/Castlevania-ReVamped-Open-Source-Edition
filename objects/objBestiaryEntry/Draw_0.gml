/// @description draw shit
scrViewData()
nes_colors()
depth = -999999

draw_set_color(c_white)
draw_set_font(fntMessage)

draw_sprite(sprBestiaryEntry,0,xview,yview)

var _scissor = gpu_get_scissor()
gpu_set_scissor(2, 128, 394, 92)
draw_text_ext(xview + 64, yview + 128 + 10 - scroll, entry_text, 10, 384 - 128)
gpu_set_scissor(_scissor)

if (entry_type == BestiaryEntryType.ENEMY)
{
	draw_sprite(sprBestiaryEnemies,(entry_pic*2) + image_index,xview+216,yview+24)
}
else if (entry_type == BestiaryEntryType.BOSS)
{
	draw_sprite(sprBestiaryBosses,(entry_pic*2) + image_index,xview+216,yview+24)
}
	
draw_set_font(fntHUD)
draw_set_halign(fa_left)

draw_text_outline(xview + 32, yview + 24, c_black, c_white, string(entry_number + 1))
draw_text_outline(xview + 16, yview + 40, c_black, nes_yellow, entry_name)
draw_text_outline(xview + 40, yview + 64, c_black, c_white, string(entry_hp))
draw_text_outline(xview + 64, yview + 80, c_black, nes_red, string(entry_kills))

