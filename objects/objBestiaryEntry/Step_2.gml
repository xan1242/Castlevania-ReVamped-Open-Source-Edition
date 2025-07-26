/// @description control the entries + deactivate
if (!visible)
	exit

scrControls()

if kCancel || kPause
{
	hideMenu()
	exit
}

var last_entry = entry_number
	
if kDown
	scroll += 1
if kUp
	scroll -= 1

if scroll < 0
	scroll = 0
if scroll > 240
	scroll = 240

if kRightTap
{
	entry_number += 1
	bitsound(sndWeaponWhip)
}
if kLeftTap
{
	entry_number -= 1
	bitsound(sndWeaponWhip)
}
	
if !kRight && !kLeft
	scrub = 0

if kRight
{
	scrub += 1
	if scrub > 30 && scrub/5 = round(scrub/5)
	{
		entry_number += 1
		bitsound(sndWeaponWhip)
	}
}

if kLeft
{
	scrub += 1
	if scrub > 30 && scrub/5 = round(scrub/5)
	{
		entry_number -= 1
		bitsound(sndWeaponWhip)
	}
}

entry_number %= entry_count
if (entry_number < 0)
	entry_number = entry_count - 1

// do on scroll
if (entry_number != last_entry)
{
	switch entry_type
	{
		case BestiaryEntryType.BOSS:
			onBossScroll(entry_number)
			break;
		case BestiaryEntryType.ENEMY:
			onEnemyScroll(entry_number)
			break;
		default:
			break;
	}
}
