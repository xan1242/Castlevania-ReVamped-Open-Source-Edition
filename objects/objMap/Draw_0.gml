scrViewData()
var mapsimonsprite_x = xview + mapsimonsprite_base.x
var mapsimonsprite_y = yview + mapsimonsprite_base.y

draw_sprite_tiled(sprMapTile,0,xview,yview)

draw_sprite(sprMapArea,0,xview + global.mapoff_x,yview + global.mapoff_y)

draw_sprite(sprite_index,image_index,mapsimonsprite_x,mapsimonsprite_y)
if (mapcorpsesprite_draw)
{
	var mapcorpsesprite_x = xview + mapcorpsesprite_x_base
	var mapcorpsesprite_y = yview + mapcorpsesprite_y_base
	
	draw_sprite(sprMapCorpse,image_index, mapcorpsesprite_x, mapcorpsesprite_y)
}

for (var i = 0; i < array_length(draw_data); i++) {
    var tile = draw_data[i];
    draw_sprite(sprMapTile, tile.img, tile.x + xview + global.mapoff_x, tile.y + yview + global.mapoff_y);
}