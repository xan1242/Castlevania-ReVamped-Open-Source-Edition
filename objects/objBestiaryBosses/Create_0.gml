// Inherit the parent event
event_inherited();

var bossCount = 10
init(BestiaryEntryType.BOSS, bossCount, 0)

for (var i = 0; i < bossCount; i++)
{
	var entry = get_boss_name_numbered(i, true)
	array_push(entry_list_str, entry)
}
