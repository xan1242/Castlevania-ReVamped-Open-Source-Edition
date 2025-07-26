/// @description change selection
scrControls()

if instance_number(objFadeInShutter) = 0 && image_index != 10
	image_speed = 1

if image_index >= 3
{
	if ((!selection_confirmed) && (selection_count > 1))
	{
		var selection_delta = 0;
		if (kDownTap)
			selection_delta = 1;
		else if (kUpTap)
			selection_delta = -1;
		
		if (selection_delta != 0)
			bitsound(sndWeaponWhip)
		
		selection += selection_delta;
		selection %= selection_count;
		if (selection < 0)
			selection = selection_count - 1;
	}

	if (kAccept or kPause) && !selection_confirmed
	{
		selection_confirmed = true
		bitsound(sndMenuSelect)
		switch (selection)
		{
			case 0:
				alarm[0] = 60
				audio_stop_sound(bgmCastlevania)
				break;
			case 1:
				if (!INPUT_ON_MOBILE)
					game_end();
				break;
			default:
				break;
		}
	}

	//if selection = 0
	//	title_text = "[ START ]\nQUIT"
	//if selection = 1
	//	title_text = "START\n[ QUIT ]"
	//if selection >= 2
	//{
	//	if selection/2 = round(selection/2)
	//		title_text = "\nQUIT"
	//	else
	//		title_text = "START\nQUIT"
	//}
}

if kPause or kAccept
	image_index = 9