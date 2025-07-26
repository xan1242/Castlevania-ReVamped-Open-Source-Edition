depth = -146
isWarpMap = false

mapsimonsprite_base = get_map_position();

mapcorpsesprite_x_base = 0
mapcorpsesprite_y_base = 0
mapcorpsesprite_draw = false
draw_data = undefined

function setMapSimonPos(_x, _y)
{
	mapsimonsprite_base.x = _x
	mapsimonsprite_base.y = _y
}

function init(_isWarpMap)
{
	write_globals()
	isWarpMap = _isWarpMap
	
	if ds_map_find_value(global.savedata,"corpse map x") != undefined && ds_map_find_value(global.savedata,"corpse map y") != undefined
	{
		if global.arsenalswap_card = 2 &&  (ds_map_find_value(global.savedata,"corpse map x") + ds_map_find_value(global.savedata,"corpse map y") > 0)
		{
			mapcorpsesprite_x_base =  ds_map_find_value(global.savedata,"corpse map x")
			mapcorpsesprite_y_base =  ds_map_find_value(global.savedata,"corpse map y")
			mapcorpsesprite_draw = true
		}
	}
	
	// Initialize an array or list to hold draw data
	draw_data = array_create(0);
	

	// Loop and populate draw_data
	for (var drawColumn = 1; drawColumn < 64; drawColumn++) {
	    for (var drawRow = 1; drawRow < 24; drawRow++) {
	        //var drawtile = "column" + string(drawColumn) + "_" + "row" + string(drawRow) + "_area0";
	        //var tileimage = ds_map_find_value(global.savedata, drawtile);
			
			var tileimage = global.mapdata.Get(EncodeMapKey(drawColumn, drawRow));
			if (tileimage == undefined) 
			{
	            tileimage = 0;
	        }

	        var pos_x = (drawColumn * 6);
	        var pos_y = (drawRow * 6);

	        // Store as a struct with image index and position
	        array_push(draw_data, {
	            img: tileimage,
	            x: pos_x,
	            y: pos_y
	        });
	    }
	}
}

function postinit()
{
	if (!isWarpMap)
		deactivate()
}


