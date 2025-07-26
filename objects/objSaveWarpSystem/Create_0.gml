/// @description setup

//
// declarations + definitions
//

depth = -146
selection = global.area
menu_selection = 0;
// always the actual area number
selected_area = selection;
selected_string = "";
selected_cost_str = "";
flash = 0

// warp speed teleportation
engage = false;

mapScreenObj = undefined

warp_costs = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
destinations = 
[
	entEntranceHallSave,
	undUndergroundMineSave,
	torTortureLabSave,
	ruiCastleRuinsSave,
	catCatacombsSave,
	couCastleCourtyardSave,
	towTowerBridgeSave,
	toyToyRoomSave,
	dunDungeonSave,
	marMarbleGallerySave,
	cloClockTowerSave,
];

area_strings =
[
	"Entrance Hall - Welcome Hall",
	"Underground Mine - Card Salesman",
	"Torture Lab - Chapel Hall",
	"Castle Ruins - Crossway",
	"Catacombs - Gateway",
	"Castle Courtyard - Drained Aqueduct",
	"Tower Bridge - Royal Bridge",
	"Toy Room - Hall of Mirrors",
	"Dungeon - Experiment Chamber",
	"Marble Gallery - Portrait Gallery",
	"Clock Tower - Royal Lounge",
];

area_count = array_length(area_strings)

unlocked_areas = [ false, false, false, false, false, false, false, false, false, false, false ];
unlocked_areas_list = [];
unlocked_areas_count = 0;

//
// setup
//

if (selection == 1)
	selection = 2
else if (selection == 2)
	selection = 1

save_rank = selection + 1;

var area_save_keys = 
[
	"entrance hall save",
	"underground mine save",
	"torture lab save",
	"castle ruins save",
	"catacombs save",
	"castle courtyard save",
	"tower bridge save",
	"toy room save",
	"dungeon save",
	"marble gallery save",
	"clock tower save",
];

//
// check unlocks & calculate warp costs
//

for (var i = 0; i < area_count; i++)
{
	var unlocked = ds_map_find_value(global.savedata,area_save_keys[i]) != undefined;
	unlocked_areas[i] = unlocked;
	
	if (unlocked)
	{
		array_push(unlocked_areas_list, i);
		if (i == selection)
		{
			menu_selection = array_length(unlocked_areas_list) - 1;
		}
	}
	
	warp_costs[i] = abs( save_rank - (i + 1) ) * 10;
}

unlocked_areas_count = array_length(unlocked_areas_list);
onSelectionChanged(0);

//
// methods
//

function get_area_string(areanum)
{
	if ((areanum < 0) || (areanum >= array_length(area_strings)))
		return "Undiscovered";
	
	if (!unlocked_areas[areanum])
		return "Undiscovered";
	
	return area_strings[areanum];
}

function onSelectionChanged(delta)
{
	if (delta != 0)
		bitsound(sndWeaponWhip);
	
	menu_selection += delta;
	menu_selection %= unlocked_areas_count;
	if (menu_selection < 0)
		menu_selection = unlocked_areas_count;
	
	selection = unlocked_areas_list[menu_selection]
	selected_string = get_area_string(selection);
	selected_cost_str = string(warp_costs[selection]);
	
	selected_area = selection;
	if (selected_area == 1)
		selected_area = 2;
	else if (selected_area == 2)
		selected_area = 1;
}

//
// activation
//

bitsound(sndPickupOrb)

application_surface_enable(true);
screen_sprite = sprite_create_from_surface(application_surface, 0, 0, 400, 224, false, false, 0, 0);

mapScreenObj = instance_create_depth(x, y, 0, objWarpMap)
deactivate()
instance_activate_object(mapScreenObj)
