if (engage == false)
	bitsound(sndDoor)
else
{
	engage = false;
	bitsound(sndPickupOrb)
	global.gold -= warp_costs[selection]
	room_goto(destinations[selection])
	if instance_number(objSavePoint) > 0 && player_exists() = true
	{
		parPlayer.x = objSavePoint.x 
		parPlayer.y = objSavePoint.y 
		parPlayer.i_frames = 60
	}
	instance_create(0,0,objBlackoutLoad)
	global.warpsnap = true
}

if sprite_exists(screen_sprite)
	sprite_delete(screen_sprite)

if (mapScreenObj != undefined)
	instance_destroy(mapScreenObj)
instance_activate_all()
