function item_messages()
{
global.message_lifemaxup = @"LIFE MAX UP
Maximum HP increased by 1. HP fully restored."

global.message_heartmaxup = @"HEART MAX UP
Maximum number of hearts increased by 5. Press " + InputIconGet(INPUT_VERB.SUBWEAPON) + " to use sub-weapons."

global.message_whipaim = @"DYNAMIC STRIKE
Aim your whip in 8 directions. Hold a direction and press " + InputIconGet(INPUT_VERB.ATTACK) + ". Hold " + InputIconGet(INPUT_VERB.AIMLOCK) + " to prevent movement while aiming."

global.message_slide = @"BREEZEY SLIDE
Pass through tight spaces with an unoffensive slide. Hold " + InputIconGet(INPUT_VERB.DOWN) + " and press " + InputIconGet(INPUT_VERB.JUMP) +  " while on the ground. Hold " + InputIconGet(INPUT_VERB.DOWN) + " to slide continuously."

global.message_morningstar = @"MORNING STAR
Elongated chain whip that can break certain types of blocks. Press " + InputIconGet(INPUT_VERB.ATTACK) +  " to strike with the whip."

global.message_walljump = @"GRIPPING CLAWS
Slides down walls and grants the ability to wall-jump. Press " + InputIconGet(INPUT_VERB.JUMP) +  " while holding a direction against a wall."

global.message_groundpound = @"BRIDGE SNAPPER
Destroy thin blocks with an offensive dive move. Hold " + InputIconGet(INPUT_VERB.DOWN) + " and press " + InputIconGet(INPUT_VERB.JUMP) +  " while in the air. A damaging shockwave is released upon landing."

global.message_flamewhip = @"FLAME WHIP
A burning chain whip that deals repetitive damage and destroys certain types of blocks. Hold " + InputIconGet(INPUT_VERB.ATTACK) + " to keep whip extended. Press " + InputIconGet(INPUT_VERB.SWAP) + " to swap the current whip."

global.message_icewhip = @"FROST WHIP
An ice-cold chain whip that deals massive damage and destroys certain types of blocks. Press " + InputIconGet(INPUT_VERB.SWAP) + " to swap the current whip."

global.message_thunderwhip = @"THUNDER WHIP
A quick-to-swing electrified chain whip that deals minor damage and destroys certain types of blocks. Press " + InputIconGet(INPUT_VERB.SWAP) + " to swap the current whip."

global.message_dubblejump = @"LEAP STONE
Allows a second jump to be performed. Press " + InputIconGet(INPUT_VERB.JUMP) + " while in midair."

global.message_dash = @"DASH STONE
Grants the ability to perform a gravity-defying dash. Hold " + InputIconGet(INPUT_VERB.DASH) + " to use the dash. A dash can be performed endlessly in the air."

global.message_waterarmor = @"AQUATIC ARMOR
Allows full range of movement in water. Ability to wall-jump, dash and double-jump underwater restored."

global.message_superslide = @"SPIKED BOOTS
A faster slide move with minor offensive capability. Destroys certain kinds of blocks. Hold " + InputIconGet(INPUT_VERB.DOWN) + " and press " + InputIconGet(INPUT_VERB.JUMP) +  " while on the ground. Hold " + InputIconGet(INPUT_VERB.DOWN) + " to slide continuously."
}

function card_messages()
{
	knife_string = "??????\n"
	axe_string = "??????\n"
	holywater_string = "??????\n"
	bible_string = "??????\n"
	boomerang_string = "??????\n"
	rosary_string = "??????\n"
	stopwatch_string = "??????\n"
	laurel_string = "??????\n"
	healingstrike_string = "??????\n"
	cardiacstrike_string = "??????\n"
	heartdiscount_string = "??????\n"
	critical_string = "??????\n"
	blazingstride_string = "??????\n"
	phaseslide_string = "??????\n"
	meteordash_string = "??????\n"
	arsenalswap_string = "??????\n"
	kinship_string = "??????\n"
	cursed_string = "??????\n"
	
	if global.knife_card > 0 
		knife_string = "Knife Card\nTriples the amount of knives thrown using the Knife subweapon."
	if global.axe_card > 0 
		axe_string = "Axe Card\nIncreases the area covered by the Axe subweapon."
	if global.holywater_card > 0 
		holywater_string = "Holy Water Card\nThe Holy Water subweapon gains a trailing effect."
	if global.bible_card > 0 
		bible_string = "Bible Card\nIncreases the area covered by the Bible subweapon."
	if global.boomerang_card > 0 
		boomerang_string = "Boomerang Card\nSlows the effect of the Boomerang subweapon, allowing more damage to accumulate."
	if global.rosary_card > 0 
		rosary_string = "Rosary Card\nWidens the area covered by the Rosary subweapon."
	if global.watch_card > 0 
		stopwatch_string = "Stopwatch Card\nDoubles the effect time of the Stopwatch subweapon."
	if global.laurel_card > 0 
		laurel_string = "Laurel Card\nDoubles the amount of healing by the Laurel subweapon."
	if global.healingstrike_card > 0 
		healingstrike_string = "Healing Strike Card\nEvery few successful whip strikes, HP is healed by 1."
	if global.cardiacstrike_card > 0 
		cardiacstrike_string = "Cardiac Strike Card\nEvery successful strike of the whip drops a heart."
	if global.heartdiscount_card > 0 
		heartdiscount_string = "Heart Discount Card\nReduces the heart cost of subweapons."
	if global.critical_card > 0 
		critical_string = "Critical Card\nAdds a chance for all weapons to deal critical hits and reveals damage values."
	if global.blazingsteps_card > 0 
		blazingstride_string = "Blazing Stride Card\nA trail of flames will appear in the user's footsteps."
	if global.phaseslide_card > 0 
		phaseslide_string = "Heavy Boots Card\nNegates the effects of knockback when damaged."
	if global.meteordash_card > 0 
		meteordash_string = "Meteor Dash Card\nAdds offensive capability to the Dash. Requires an additional ability."
	if global.arsenalswap_card > 0 
		arsenalswap_string = "Corpse Run Card\nAllows one chance to obtain lost money after a death."
	if global.kinship_card > 0 
		kinship_string = "Kinship Card\nSummons a familiar to attack enemies."
	if global.cursed_card > 0 
		cursed_string = "Cursed Card\nAll damage is fatal and subweapons cost twice as many hearts, but enemies drop 3 times as much money."	
}

function shop_messages()
{
		knife_description = "Knife Card\nTriples the amount of knives thrown using the Knife subweapon."
		axe_description = "Axe Card\nIncreases the area covered by the Axe subweapon."
		holywater_description = "Holy Water Card\nThe Holy Water subweapon gains a trailing effect."
		bible_description = "Bible Card\nIncreases the area covered by the Bible subweapon."
		boomerang_description = "Boomerang Card\nSlows the effect of the Boomerang subweapon, allowing more damage to accumulate."
		rosary_description = "Rosary Card\nWidens the area covered by the Rosary subweapon."
		stopwatch_description = "Stopwatch Card\nDoubles the effect time of the Stopwatch subweapon."
		laurel_description = "Laurel Card\nDoubles the amount of healing by the Laurel subweapon."
		healingstrike_description = "Healing Strike Card\nEvery few successful whip strikes, HP is healed by 1."
		cardiacstrike_description = "Cardiac Strike Card\nEvery successful strike of the whip drops a heart."
		heartdiscount_description = "Heart Discount Card\nReduces the heart cost of subweapons."
		critical_description = "Critical Card\nAdds a chance for all weapons to deal critical hits and reveals damage values."
		blazingstride_description = "Blazing Stride Card\nA trail of flames will appear in the user's footsteps."
		phaseslide_description = "Heavy Boots Card\nNegates the effects of knockback when damaged."
		meteordash_description = "Meteor Dash Card\nAdds offensive capability to the Dash. Requires an additional ability."
		arsenalswap_description = "Corpse Run Card\nAllows one chance to obtain lost money after a death."
		kinship_description = "Kinship Card\nSummons a familiar to attack enemies."
		cursed_description = "Cursed Card\nAll damage is fatal and subweapons cost twice as many hearts, but enemies drop 3x as much cash."	
}

function get_enemy_name(entry_number, bBestiaryCheckUnlock = false)
{
	var enemy_names =
	[
		"Zombie",
		"Black Leopard",
		"Vampire Bat",
		"Fish-Man",
		"The Black Knight",
		"Medusa Head",
		"Ghost",
		"Dragon Skull Cannon",
		"Stained-Glass Ghost",
		"Slime",
		"Beholder",
		"Gargoyle",
		"Skele-Dragon",
		"Blazing Spirit",
		"Hunchback",
		"Skeleton",
		"Raven",
		"Stone Man",
		"Hellhound",
		"Floating Skull",
		"Spider",
		"Mini-Mummy",
		"Thornweed",
		"Eagle",
		"Wall-Widow",
		"Swamp Thing",
		"Water Blob",
		"Frog",
		"Mudman",
		"Bone Scimitar",
		"Yorick",
		"Winged Guard",
		"Lesser Demon",
		"Killer Toys",
		"Killer Mirror",
		"Jack O'Bones",
		"Dulachan",
		"Golden Guard",
		"Gremlin",
		"Frosty Bones",
		"Creeper Bones",
		"Blood Skeleton",
		"Bone Claymore",
		"Axe Knight",
		"Freddie",
		"Ectoplasm",
		"Rose Demon",
		"Blue Crow",
		"Burning Man",
		"Harpy",
	];
	
	if (bBestiaryCheckUnlock)
	{
		if (!is_enemy_entry_unlocked(entry_number))
			return("????????????")
	}
	
	if (entry_number >= array_length(enemy_names))
		return("????????????")
	
	return enemy_names[entry_number]
}

function get_boss_name(entry_number, bBestiaryCheckUnlock = false)
{
	var boss_names =
	[
		"Phantom Bat",
		"Medusa",
		"Golem",
		"Mummy Man",
		"The Creature",
		"Mirror Monster",
		"Granfalloon",
		"Cthulhu",
		"The Grim Reaper",
		"Dark Lord Dracula",
	];
	
	if (bBestiaryCheckUnlock)
	{
		if (!is_boss_entry_unlocked(entry_number))
			return("????????????")
	}
	
	if (entry_number >= array_length(boss_names))
		return("????????????")
	
	return boss_names[entry_number]
}

function get_enemy_name_numbered(entry_number, bBestiaryCheckUnlock = false)
{
	var ret = string_format(entry_number + 1, 2, 0) + ". " + get_enemy_name(entry_number, bBestiaryCheckUnlock)
	if (string_char_at(ret, 1) == " ")
		ret = "0" + string_copy(ret, 2, string_length(ret) - 1)
	return ret
}

function get_boss_name_numbered(entry_number, bBestiaryCheckUnlock = false)
{
	var ret = string_format(entry_number + 1, 2, 0) + ". " + get_boss_name(entry_number, bBestiaryCheckUnlock)
	if (string_char_at(ret, 1) == " ")
		ret = "0" + string_copy(ret, 2, string_length(ret) - 1)
	return ret
}

function enemy_nametags(entry_number)
{
	return get_enemy_name_numbered(entry_number)
}

function boss_nametags(entry_number)
{
	return get_boss_name_numbered(entry_number)
}
