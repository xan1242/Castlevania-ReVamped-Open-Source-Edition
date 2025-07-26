/// @description Draw it all
var _string = "";
_string += "INPUT OPTIONS\n";
_string += "\n";
_string += InputIconGet(INPUT_VERB.CANCEL) + " = Return  " + InputIconGet(INPUT_VERB.MAP) + " = Reset Defaults\n" ;

//Show the rebinding menu if we're paused
if (pause)
{
    var _device = InputPlayerGetDevice();
    if (!InputDeviceGetRebinding(_device))
    {
        _string += "Select an action to remap:\n";
        _string += "\n";
        
        //This is a bit clumsy but sufficient for this example
        //In a real situation you'll probably want to handle this with an array
        if (menu_selection == 0) _string += ">  ";
        _string += InputIconGet(INPUT_VERB.LEFT) + " = LEFT\n";
        
        if (menu_selection == 1) _string += ">  ";
        _string += InputIconGet(INPUT_VERB.RIGHT) + " = RIGHT\n";
        
        if (menu_selection == 2) _string += ">  ";
        _string += InputIconGet(INPUT_VERB.UP) + " = UP\n";
        
        if (menu_selection == 3) _string += ">  ";
        _string += InputIconGet(INPUT_VERB.DOWN) + " = DOWN\n";
        
        if (menu_selection == 4) _string += ">  ";
        _string += InputIconGet(INPUT_VERB.JUMP) + " = JUMP\n";
		
        if (menu_selection == 5) _string += ">  ";
        _string += InputIconGet(INPUT_VERB.ATTACK) + " = MAIN WEAPON\n";
        
        if (menu_selection == 6) _string += ">  ";
        _string += InputIconGet(INPUT_VERB.SUBWEAPON) + " = SUBWEAPON\n";
        
        if (menu_selection == 7) _string += ">  ";
        _string += InputIconGet(INPUT_VERB.DASH) + " = DASH\n";
        
        if (menu_selection == 8) _string += ">  ";
        _string += InputIconGet(INPUT_VERB.SWAP) + " = SWAP WEAPON\n";
        
	    if (menu_selection == 9) _string += ">  ";
        _string += InputIconGet(INPUT_VERB.AIMLOCK) + " = LOCK MOVEMENT\n";
		
        if (menu_selection == 10) _string += ">  ";
        _string += InputIconGet(INPUT_VERB.PAUSE) + " = PAUSE SCREEN\n";
		
        if (menu_selection == 11) _string += ">  ";
        _string += InputIconGet(INPUT_VERB.MAP) + " = MAP SCREEN\n";
    }
    else
    {
        //Display what verb we're rebinding if we're scanning for a new verb
        _string += "REBINDING \"" + InputVerbGetExportName(rebinding_verb);
        _string += "\nWait 5s to cancel rebinding\n";
    }
}
else
{
    //Display a control prompt for basic player movement
    _string += InputIconGet(INPUT_VERB.LEFT) + "/" + InputIconGet(INPUT_VERB.RIGHT) + "/" + InputIconGet(INPUT_VERB.UP) + "/" + InputIconGet(INPUT_VERB.DOWN) + " = Move\n";
}

draw_set_font(fntMessage)
draw_set_color(c_white)

draw_text_scribble(8, 8, _string);