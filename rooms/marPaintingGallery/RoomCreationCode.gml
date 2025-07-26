//MARBLE GALLY WALLY
area_setup(9,47,4)

if current_month >= 12 || current_month <= 2
	layer_set_visible(layer_get_id("Tiles_winter"),true)
else if current_month >= 3 && current_month <= 5 
	layer_set_visible(layer_get_id("Tiles_spring"),true)
else if current_month >= 6 && current_month <= 8
	layer_set_visible(layer_get_id("Tiles_summer"),true)
else if current_month >= 9 && current_month <= 11
	layer_set_visible(layer_get_id("Tiles_fall"),true)
else
	layer_set_visible(layer_get_id("Tiles_summer"),true)
