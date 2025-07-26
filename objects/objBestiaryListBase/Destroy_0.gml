/// @description
instance_destroy(bestiaryEntryObj)

if cancelled
{
	var outDest = bestiary_menu_sel
	with( instance_create_depth(x,y,0,objBestiaryMenu) )
	{
		selection = outDest
	}
}

instance_create(x,y,objFadeInShutter)