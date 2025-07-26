/// @description setup
cancelled = false
bestiary_menu_sel = 0
scrub = 0
entry_list_str = []
entry_list_type = BestiaryEntryType.UNKNOWN

instance_create(x,y,objFadeInShutter)
bestiaryEntryObj = undefined

menu_selected = 0
menu_scroll = 0;
menu_visible_count = 20;

line_height = 10;
scrollable = false

deactivate()

function init(listtype, listcount, pausemenuexit)
{
	entry_list_type = listtype
	bestiaryEntryObj = instance_create_depth(0, 0, 0, objBestiaryEntry)
	bestiaryEntryObj.parentMenu = self
	bestiaryEntryObj.entry_type = listtype
	bestiaryEntryObj.entry_count = listcount
	bestiary_menu_sel = pausemenuexit
	scrollable = listcount >= menu_visible_count
}

function setSelected(item)
{
	menu_selected = item
	//if (scrollable)
	//	menu_scroll = menu_selected
}
