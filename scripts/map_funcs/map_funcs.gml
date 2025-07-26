function Vector2(_x = 0, _y = 0) constructor
{
    x = _x;
    y = _y;
}

function KeyValuePair(_key = 0, _value = 0) constructor
{
    key = _key;
    value = _value;
}

function KeyValueMap() constructor
{
	_array = array_create(0)
	
	static Clear = function()
	{
		if (array_length(_array))
			array_delete(_array, 0, array_length(_array));
	}
	
	//static Size = function()
	//{
	//	return array_length(_array);
	//}
	
	static Iterate = function(iterator)
	{
		for (var i = 0; i < array_length(_array); i++)
		{
			iterator(_array[i].key, _array[i].value)
		}
	}
	
	//static At = function(index)
	//{
	//	if (index < 0)
	//		return undefined;
	//	if (index >= array_length(_array))
	//		return undefined;
	//	return _array[index]
	//}
	
	//static Front = function()
	//{
	//	if (array_length(_array) == 0)
	//		return undefined;
	//	return array[0];
	//}
	
	//static Back = function()
	//{
	//	if (array_length(_array) == 0)
	//		return undefined;
	//	return array[array_length(_array) - 1];
	//}
	
	//static Pop = function()
	//{
	//	if (array_length(_array) == 0)
	//		return undefined;
	//	return array_pop(_array);
	//}
	
	static Find = function(key)
	{
		for (var i = 0; i < array_length(_array); i++)
		{
			if (_array[i].key == key)
				return i;
		}
		
		return -1
	}
	
	//static Erase = function(key)
	//{
	//	var currIndex = Find(key)
	//	if (currIndex == -1)
	//		return;
		
	//	array_delete(_array, currIndex, 1)
	//}
	
	static PushEntry = function(key, value)
	{
		var kvpair = new KeyValuePair();
		kvpair.key = key
		kvpair.value = value
		
		array_push(_array, kvpair)
	}
	
	static Set = function(key, value)
	{
		var currIndex = Find(key)
		if (currIndex == -1)
			return PushEntry(key, value)
		
		var kvpair = new KeyValuePair();
		kvpair.key = key
		kvpair.value = value
		
		_array[currIndex] = kvpair
	}
	
	static Get = function(key)
	{
		var currIndex = Find(key)
		if (currIndex == -1)
			return undefined;
		
		return _array[currIndex].value;
	}
}

function EncodeMapKey(_column, _row)
{
	// columns are in the upper 16 bits, rows are in lower 16 bits
	return (((_column & 0xFFFF) << 16) | (_row & 0xFFFF)) & 0xFFFFFFFF;
}

function DecodeMapKey(_key)
{
	var column = (_key >> 16) & 0xFFFF;
	var row = _key & 0xFFFF;
	
	return [column, row];
}

function DeserializeMapDataFromSaveData()
{
	var prefix = "column";
	var suffix = "_area0";
	
    var keys = ds_map_keys_to_array(global.savedata)
	var key_count = array_length(keys)
	
	global.mapdata.Clear();

    for (var i = 0; i < key_count; ++i) {
        var key = keys[i];
        if (string_starts_with(key, prefix) & string_ends_with(key, suffix)) 
		{
            // Extract column and row numbers
            var parts = string_split_ext(key, ["column", "_row", "_area"]);
			var column = real(parts[1]);
			var row = real(parts[2]);
			
			var val = ds_map_find_value(global.savedata, key);
			global.mapdata.Set(EncodeMapKey(column, row), val);
        }
    }

    array_delete(keys, 0, array_length(keys)); // free temp array
}

function SerializeMapDataToSaveData()
{
	global.mapdata.Iterate(function(key, value)
	{
		var colrow = DecodeMapKey(key);
		//column1_row1_area0 
		var currentmaptile = "column" + string(colrow[0]) + "_" + "row" + string(colrow[1]) + "_" + "area0";
		ds_map_replace(global.savedata, currentmaptile, value);
	});
}

function update_map_position()
{
    if instance_number(parPlayer) == 0
    {
        return
    }

    //var grid_x = 0
    //var grid_y = 0
    var dsgrid_x = 0 
    var dsgrid_y = 0 
    var simon_x = 0
    var simon_y = 0
    var currentmaptile = 0

    //grid_x = floor(parPlayer.x / 400) * 6
    //grid_y = floor(parPlayer.y / 224) * 6
    //calculate a coordiante-only version for the DS map
    dsgrid_x = floor(parPlayer.x / 400) 
    dsgrid_y = floor(parPlayer.y / 224) 
    //if grid_x < 0
    //	grid_x = 0
    //if grid_x > (room_width/400) * 6
    //	grid_x = (room_width/400) * 6
    //fixed map vars:
    if dsgrid_x < 0
    	dsgrid_x = 0
    if dsgrid_x > (room_width/400)
    	dsgrid_x = (room_width/400)

    //if grid_y < 0
    //	grid_y = 0
    //if grid_y > (room_height/224) * 6
    //	grid_y = (room_height/224) * 6
    //fixed map vars:
    if dsgrid_y < 0
    	dsgrid_y = 0
    if dsgrid_y > (room_height/224)
    	dsgrid_y = (room_height/224)
    
    simon_x = global.mx + dsgrid_x
    simon_y = global.my + dsgrid_y
	
	if ((simon_x != global.last_map_simon_x) || (simon_y != global.last_map_simon_y))
	{
		global.last_map_simon_x = simon_x;
		global.last_map_simon_y = simon_y;
		
		currentmaptile = EncodeMapKey(simon_x, simon_y);
		var setStatus = 1;
		if (global.needcheckmark == true)
		{
			setStatus = 2;
			global.needcheckmark = false;
		}
	
		global.mapdata.Set(currentmaptile, setStatus);
	}
}

function get_map_position()
{
	if instance_number(parPlayer) == 0
    {
        return new Vector2();
    }
	
	var grid_x = floor(parPlayer.x / 400) * 6
    var grid_y = floor(parPlayer.y / 224) * 6
	return new Vector2((global.mx*6) + grid_x + global.mapoff_x, (global.my*6) + grid_y + global.mapoff_y);
}


