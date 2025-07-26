// Inherit the parent event
event_inherited();

var enemyCount = 50
init(BestiaryEntryType.ENEMY, enemyCount, 0)

for (var i = 0; i < enemyCount; i++)
{
	var entry = get_enemy_name_numbered(i, true)
	array_push(entry_list_str, entry)
}
