/// @description controls
if (!visible)
	exit

scrControls()

menu_selected %= array_length(entry_list_str)
if (menu_selected < 0)
	menu_selected = array_length(entry_list_str) - 1
if (scrollable)
{
	// Adjust scroll if selected is out of visible range
	if (menu_selected < menu_scroll) {
	    menu_scroll = menu_selected;
	}
	if (menu_selected >= menu_scroll + menu_visible_count) {
	    menu_scroll = menu_selected - menu_visible_count + 1;
	}
}

if kUpTap
{
	menu_selected -= 1
	bitsound(sndWeaponWhip)
}

if kDownTap
{
	menu_selected += 1
	bitsound(sndWeaponWhip)
}

if !kUp && !kDown
	scrub = 0

if kUp
{
	scrub += 1
	if scrub > 30 && scrub/5 = round(scrub/5)
		{menu_selected -= 1 bitsound(sndWeaponWhip)}
}

if kDown
{
	scrub += 1
	if scrub > 30 && scrub/5 = round(scrub/5)
		{menu_selected += 1 bitsound(sndWeaponWhip)}
}

if kAccept
{
	bitsound(sndMenuSelect)
	bestiaryEntryObj.entry_type = entry_list_type
	
	if (entry_list_type == BestiaryEntryType.ENEMY)
		bestiaryEntryObj.onEnemyScroll(menu_selected)
	else if (entry_list_type == BestiaryEntryType.BOSS)
		bestiaryEntryObj.onBossScroll(menu_selected)
	
	bestiaryEntryObj.showMenu()
	exit
}

if kCancel or kPause
{
	cancelled = true
	bitsound(sndPickupHeart)
	instance_destroy()
}
