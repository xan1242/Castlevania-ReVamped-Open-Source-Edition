/// @description pause / load file / max managing / text scripts / area names
if global.hp >= global.hp_max
	global.hp = global.hp_max
if global.hp <= 0
	global.hp = 0
	
if global.hearts >= global.hearts_max
	global.hearts = global.hearts_max
if global.hearts <= 0
	global.hearts = 0

if room = rmLoadGame
{
	load_game()
	write_globals()
}

update_map_position()

scrControls()

if (kPause /*|| (os_is_paused())*/)
{
	global.screen_sprite = sprite_create_from_surface(application_surface, 0, 0, 400, 224, false, false, 0, 0);
	bitsound(sndMenuPause)
	if !global.boss_rush 
		if (!instance_exists(objPauseMenu))
			instance_create(x,y,objPauseMenu)
	else
		if (!instance_exists(objPauseMenuBossRush))
			instance_create(x,y,objPauseMenuBossRush)
}

if (kMap)
{
	if (!global.map_exiting)
	{
		bitsound(sndMenuPause)
		instance_create(x, y, objRegularMap)
		exit
	}
}
else
	global.map_exiting = false

//area name tracker
if area_tracker != global.area //if the area has changed and isn't a transition room...
{
	if global.area != 12 
		instance_create(x,y,objAreaName)
	area_tracker = global.area
}


