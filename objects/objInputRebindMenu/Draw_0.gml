/// @description Draw it all
var _string = "";
_string += "MENU INPUT OPTIONS\n";
_string += "\n";
_string += InputIconGet(INPUT_VERB.PAUSE) + " = Return  " + InputIconGet(INPUT_VERB.MAP) + " = Reset Defaults\n" ;

//Show the rebinding menu if we're paused
if (pause)
{
    if (!InputDeviceGetRebinding(InputPlayerGetDevice()))
    {
        _string += "Select an action to remap:\n";
        _string += "\n";
        
        //This is a bit clumsy but sufficient for this example
        //In a real situation you'll probably want to handle this with an array
        if (menu_selection == 0) _string += ">  ";
        _string += InputIconGet(INPUT_VERB.ACCEPT) + " = ACCEPT\n";
		
        if (menu_selection == 1) _string += ">  ";
        _string += InputIconGet(INPUT_VERB.CANCEL) + " = CANCEL\n";
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