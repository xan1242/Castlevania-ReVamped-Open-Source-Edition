/// @description file independent variables + BGM loop points
global.options = ds_map_create()
global.oldtvfilter_enabled = false
global.screen_sprite = undefined
if (debug_mode)
{
	global.debug_ui_active = false
}
texturegroup_set_mode(true)

//First Init the System, specify the name of the pal swap shader in case you've changed it for some reason.
pal_swap_init_system(shd_pal_swapper);

set_loop_points()


surface_resize(application_surface, 400, 224);
display_set_gui_size(400, 224)

global.tex_outline_offsets = [
		[-1,  0],
		[ 1,  0],
		[ 0, -1],
		[ 0,  1],
		[-1, -1],
		[-1,  1],
		[ 1, -1],
		[ 1,  1]
	];
global.tex_outline_offset_len = array_length(global.tex_outline_offsets)

enum AreaNumber
{
	Entrance,
	Lab,
	Caverns,
	Ruins,
	Catacombs,
	Courtyard,
	Bridge,
	ToyRoom,
	Dungeon,
	MarbleGallery,
	ClockTower,
	Keep,
	GateOrHall,
	BossRush,
};

global.last_map_simon_x = 0
global.last_map_simon_y = 0

//load options
if (!file_exists("Castlevania_Options.sav"))
{
	global.volumeSFX = 1
	global.volumeBGM = 1
	global.vibration = true
	
	if ds_map_find_value( global.options,"icon files 0" ) = undefined
		ds_map_replace( global.options,"icon file 0",0 )
	if ds_map_find_value( global.options,"icon files 1" ) = undefined
		ds_map_replace( global.options,"icon file 1",0 )
	if ds_map_find_value( global.options,"icon files 2" ) = undefined
		ds_map_replace( global.options,"icon file 2",0 )
	
	ds_map_replace(global.options,"controls_kbm",InputBindingsExport(false))
	ds_map_replace(global.options,"controls_gp",InputBindingsExport(true))
}
else
{
	global.options = ds_map_secure_load("Castlevania_Options.sav")
	
	global.volumeSFX = ds_map_find_value(global.options,"volumeSFX")
	global.volumeBGM = ds_map_find_value(global.options,"volumeBGM")
	global.vibration = ds_map_find_value(global.options,"vibration")
	
	
	if ds_map_find_value(global.options,"windowscale") = undefined
		ds_map_replace(global.options,"windowscale",1)
	if ds_map_find_value(global.options,"fullscreen") = undefined
		ds_map_replace(global.options,"fullscreen",false)
	
	//load controls if they exist
	if ds_map_find_value(global.options,"controls_kbm") != undefined
	{
		InputBindingsImport(false, ds_map_to_struct(ds_map_find_value(global.options,"controls_kbm")))
	}

	if ds_map_find_value(global.options,"controls_gp") != undefined
	{
		InputBindingsImport(true, ds_map_to_struct(ds_map_find_value(global.options,"controls_gp")))
	}
		
	window_set_fullscreen(ds_map_find_value(global.options,"fullscreen"))
	window_set_size(400 * ds_map_find_value(global.options,"windowscale"), 224 * ds_map_find_value(global.options,"windowscale"));
}




	
//load ending cards
global.gallery = ds_map_create()

if (!file_exists("Castlevania_Endings.sav"))
{
	ds_map_replace(global.gallery,"ending0",0)
	ds_map_replace(global.gallery,"ending1",0)
	ds_map_replace(global.gallery,"ending2",0)
	ds_map_replace(global.gallery,"ending3",0)
	ds_map_replace(global.gallery,"bossrush",0)
	ds_map_replace(global.gallery,"record_secs",359999)
	ds_map_replace(global.gallery,"record","--:--:--\n$----")
	ds_map_secure_save(global.gallery,"Castlevania_Endings.sav")
}
else
	global.gallery = ds_map_secure_load("Castlevania_Endings.sav")

///@description Initilize System and add palettes

//This should be done before any drawing takes place 
//in a managing object that will persist through the entire game.
//Notice I've set it to persistent.  


//instance_create_depth(0, 0, -200, objTouchControls)
