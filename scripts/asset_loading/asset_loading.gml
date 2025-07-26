

function load_basic_ingame_assets()
{
	var ingame_texture_groups = 
	[
	    "Objects",
	    "Player",
	    "Enemy",
	    "Map",
	    "LvlCommon",
	    "UI_InGame",
	];

	if (!audio_group_is_loaded(SoundFXInGame))
	{
		audio_group_load(SoundFXInGame)
	}

	if (!audio_group_is_loaded(PlayerSoundFXIG))
	{
		audio_group_load(PlayerSoundFXIG)
	}
	
	for (var i = 0; i < array_length(ingame_texture_groups); i++)
	{
	    var group_name = ingame_texture_groups[i];
	    texturegroup_load(group_name, false);
	}
}

function load_boss_assets(boss_number)
{
	var boss_texture_groups = 
	[
	    "tgBossPhantomBat",
	    "tgBossMedusa",
	    "tgBossGolem",
	    "tgBossMummy",
	    "tgBossFrankie",
	    "tgBossMirrorMonster",
	    "tgBossGranfalloon",
	    "tgBossCthulu",
	    "tgBossDeath",
	    "tgBossDracula",
	];
	
	if (!audio_group_is_loaded(SoundFXBoss))
	{
		audio_group_load(SoundFXBoss)
	}

	if ((boss_number >= array_length(boss_texture_groups)) || (boss_number == 0))
		return
	
	var group_name = boss_texture_groups[boss_number];
	texturegroup_load(group_name, true);	
}



function unload_boss_assets(boss_number)
{
	var boss_texture_groups = 
	[
	    "tgBossPhantomBat",
	    "tgBossMedusa",
	    "tgBossGolem",
	    "tgBossMummy",
	    "tgBossFrankie",
	    "tgBossMirrorMonster",
	    "tgBossGranfalloon",
	    "tgBossCthulu",
	    "tgBossDeath",
	    "tgBossDracula",
	];

	if (audio_group_is_loaded(SoundFXBoss))
	{
		audio_group_unload(SoundFXBoss)
	}
	
	if ((boss_number >= array_length(boss_texture_groups)) || (boss_number == 0))
		return
		
	var group_name = boss_texture_groups[boss_number];
	texturegroup_unload(group_name);	

	gc_collect();
}

function unload_all_boss_assets()
{
	var boss_texture_groups = 
	[
	    //"tgBossPhantomBat",
	    "tgBossMedusa",
	    "tgBossGolem",
	    "tgBossMummy",
	    "tgBossFrankie",
	    "tgBossMirrorMonster",
	    "tgBossGranfalloon",
	    "tgBossCthulu",
	    "tgBossDeath",
	    "tgBossDracula",
	];

	if (audio_group_is_loaded(SoundFXBoss))
	{
		audio_group_unload(SoundFXBoss)
	}
	
	for (var i = 0; i < array_length(boss_texture_groups); i++)
	{
	    var group_name = boss_texture_groups[i];
	    texturegroup_unload(group_name);
	}

	gc_collect();
}


function unload_level_assets(area_number)
{
	var level_texture_groups = 
	[
	    "LvlEntrance",
	    "LvlLab",
	    "LvlCaverns",
	    "LvlRuins",
	    "LvlCatacombs",
	    "LvlCourtyard",
	    "LvlBridge",
	    "LvlToyRoom",
	    "LvlDungeon",
	    "LvlMarbleGallery",
	    "LvlClockTower",
	    "LvlKeep",
	    "LvlGate",
		"LvlBossRush",
	];
	
	if (area_number >= array_length(level_texture_groups))
		return
	
	var group_name = level_texture_groups[area_number];
	texturegroup_unload(group_name);
	
	if ((area_number == AreaNumber.Entrance) || (area_number == AreaNumber.BossRush))
	{
		texturegroup_unload("LvlEntranceTiles");
	}
	
	gc_collect();
}

function load_level_assets(area_number)
{
	var level_texture_groups = 
	[
	    "LvlEntrance",
	    "LvlLab",
	    "LvlCaverns",
	    "LvlRuins",
	    "LvlCatacombs",
	    "LvlCourtyard",
	    "LvlBridge",
	    "LvlToyRoom",
	    "LvlDungeon",
	    "LvlMarbleGallery",
	    "LvlClockTower",
	    "LvlKeep",
	    "LvlGate",
		"LvlBossRush",
	];
	
	if (area_number >= array_length(level_texture_groups))
		return
	
	var group_name = level_texture_groups[area_number];
	texturegroup_load(group_name, true);	
	
	if ((area_number == AreaNumber.Entrance) || (area_number == AreaNumber.BossRush))
	{
		texturegroup_load("LvlEntranceTiles", true);
	}
	
}

function unload_all_ingame_assets()
{
	var ingame_texture_groups = 
	[
	    "LvlBridge",
	    "LvlCatacombs",
	    "LvlCaverns",
	    "LvlClockTower",
	    "LvlCourtyard",
	    "LvlDungeon",
	    "LvlEntrance",
	    "LvlGate",
	    "LvlKeep",
	    "LvlLab",
	    "LvlMarbleGallery",
	    "LvlRuins",
	    "LvlToyRoom",
	    "LvlCommon",
		"LvlBossRush",
		"LvlEntranceTiles",
	    "Objects",
	    "Player",
	    "Enemy",
	    "Ending",
	    "Intro",
	    "Map",
	    "bgTitleGroup",
	    "UI_InGame",
	];
	
	for (var i = 0; i < array_length(ingame_texture_groups); i++)
	{
	    var group_name = ingame_texture_groups[i];
	    texturegroup_unload(group_name);
	}
	
	if ((global.screen_sprite != undefined) && sprite_exists(global.screen_sprite))
		sprite_delete(global.screen_sprite)
	
	if (audio_group_is_loaded(SoundFXInGame))
	{
		audio_group_unload(SoundFXInGame)
	}
	
	if (audio_group_is_loaded(SoundFXBoss))
	{
		audio_group_unload(SoundFXBoss)
	}

	if (audio_group_is_loaded(PlayerSoundFXIG))
	{
		audio_group_unload(PlayerSoundFXIG)
	}
	
	gc_collect();
	
	unload_all_boss_assets();
}
