/// @description control shit
scrControls()
bitBGM(bgmUnderground)

var numOptions = 11

if kUpTap
{
	bitsound(sndWeaponWhip)
	selection -= 1
	if (simple_platform_detect() != SIMPLEPLAT.DESKTOP)
	{
		if ((selection == 7) || (selection == 8))
			selection = 6
	}
	if selection < 0
		selection = numOptions - 1
}

if kDownTap
{
	bitsound(sndWeaponWhip)
	selection += 1
	if (simple_platform_detect() != SIMPLEPLAT.DESKTOP)
	{
		if ((selection == 7) || (selection == 8))
			selection = 9
	}
		
	selection %= numOptions
}

//set options
if kRightTap
{
	
	if selection = 0 //sfx
		{
			bitsound(sndMenuSelect)
			global.volumeSFX += 0.1
			if global.volumeSFX >= 1
				global.volumeSFX = 1
			ds_map_replace(global.options,"volumeSFX",global.volumeSFX)
		}
	if selection = 1 //bgm
		{
			bitsound(sndMenuSelect)
			audio_stop_all()
			global.volumeBGM += 0.1
			if global.volumeBGM >= 1
				global.volumeBGM = 1
			ds_map_replace(global.options,"volumeBGM",global.volumeBGM)
		}
	if selection = 2 //vibration
		{
			bitsound(sndMenuSelect)
			global.vibration = true
			ds_map_replace(global.options,"vibration",global.vibration)
		}
	if selection = 7 //window scale
		{
			bitsound(sndMenuSelect)
			if (simple_platform_detect() == SIMPLEPLAT.DESKTOP)
			{
				if ds_map_find_value(global.options,"windowscale") < 7
					ds_map_replace(global.options,"windowscale",ds_map_find_value(global.options,"windowscale")+1)
				window_set_size(400 * ds_map_find_value(global.options,"windowscale"), 224 * ds_map_find_value(global.options,"windowscale"));
			}
		}
	if selection = 8 //fullscreen
		{
			bitsound(sndMenuSelect)
			if (simple_platform_detect() == SIMPLEPLAT.DESKTOP)
			{	
				ds_map_replace(global.options,"fullscreen",true)
				window_set_fullscreen(ds_map_find_value(global.options,"fullscreen"))
			}
		}
	if selection = 9 //crt
		{
			bitsound(sndMenuSelect)
			ds_map_replace(global.options,"crt",true)
			set_crt_filter(true)
		}
}

if kLeftTap
{
	
	if selection = 0 //sfx
		{
			bitsound(sndMenuSelect)
			global.volumeSFX += -0.1
			if global.volumeSFX <= 0
				global.volumeSFX = 0
			ds_map_replace(global.options,"volumeSFX",global.volumeSFX)
		}
	if selection = 1 //bgm
		{
			bitsound(sndMenuSelect)
			bitsound(sndMenuSelect)
			audio_stop_all()
			global.volumeBGM += -0.1
			if global.volumeBGM <= 0
				global.volumeBGM = 0
			ds_map_replace(global.options,"volumeBGM",global.volumeBGM)
		}
	if selection = 2 //vibration
		{
			bitsound(sndMenuSelect)
			global.vibration = false
			ds_map_replace(global.options,"vibration",global.vibration)
		}
	if selection = 7 //window scale
		{
			bitsound(sndMenuSelect)
			if (simple_platform_detect() == SIMPLEPLAT.DESKTOP)
			{
				if ds_map_find_value(global.options,"windowscale") > 1
					ds_map_replace(global.options,"windowscale",ds_map_find_value(global.options,"windowscale")-1)
				window_set_size(400 * ds_map_find_value(global.options,"windowscale"), 224 * ds_map_find_value(global.options,"windowscale"));
			}
		}
	if selection = 8 //fullscreen
		{
			bitsound(sndMenuSelect)
			if (simple_platform_detect() == SIMPLEPLAT.DESKTOP)
			{
				ds_map_replace(global.options,"fullscreen",false)
				window_set_fullscreen(ds_map_find_value(global.options,"fullscreen"))
			}
		}
	if selection = 9 //crt
		{
			bitsound(sndMenuSelect)
			ds_map_replace(global.options,"crt",false)
			set_crt_filter(false)
		}
}

if kAccept //control customizing, default values, credits, or leave
{
	bitsound(sndMenuSelect)
	if selection = 3 //main controls
	{
		room_goto(rmControlOptions)
		ds_map_secure_save(global.options,"Castlevania_Options.sav")
	}
	if selection = 4 //menu controls
	{
		room_goto(rmMenuOptions)
		ds_map_secure_save(global.options,"Castlevania_Options.sav")
	}
	if selection = 5 //default values sans controls
	{
		global.volumeSFX = 1
		global.volumeBGM = 1
		global.vibration = true	
		audio_stop_all()
		ds_map_replace(global.options,"volumeSFX",global.volumeSFX)
		ds_map_replace(global.options,"volumeBGM",global.volumeBGM)
		ds_map_replace(global.options,"vibration",global.vibration)
	}
	if selection = 6 //credits
	{
		ds_map_secure_save(global.options,"Castlevania_Options.sav")
		room_goto(rmCreditsOptions)
	}
	if selection = 10 //exit
	{
		ds_map_secure_save(global.options,"Castlevania_Options.sav")
		room_goto(rmFileSelect)
	}
}

if kCancel
{
	bitsound(sndWeaponWhip)
	ds_map_secure_save(global.options,"Castlevania_Options.sav")
	room_goto(rmFileSelect)
}