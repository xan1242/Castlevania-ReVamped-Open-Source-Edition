///@description Only allow the player to navigate the menu if we're not rebinding anything
var _device = InputPlayerGetDevice();
if (!InputDeviceGetRebinding(_device))
{
    //Move the menu selection up and down, example for how to use 'opposing' checkers
    menu_selection += /*InputOpposingPressed(INPUT_VERB.UP, INPUT_VERB.DOWN) + */ InputOpposingRepeat(INPUT_VERB.UP, INPUT_VERB.DOWN);
        
    //Make sure we wrap around the menu
    menu_selection = (menu_selection + 12) mod 12;
        
    //Start the rebinding process when the player selects an option
    if (InputPressed(INPUT_VERB.ACCEPT))
    {
        switch(menu_selection)
        {
            case 0: rebinding_verb = INPUT_VERB.LEFT;   break;
            case 1: rebinding_verb = INPUT_VERB.RIGHT;  break;
            case 2: rebinding_verb = INPUT_VERB.UP;     break;
            case 3: rebinding_verb = INPUT_VERB.DOWN;   break;
            case 4: rebinding_verb = INPUT_VERB.JUMP;  break;
            case 5: rebinding_verb = INPUT_VERB.ATTACK;   break;
            case 6: rebinding_verb = INPUT_VERB.SUBWEAPON;  break;
            case 7: rebinding_verb = INPUT_VERB.DASH;     break;
            case 8: rebinding_verb = INPUT_VERB.SWAP;   break;
			case 9: rebinding_verb = INPUT_VERB.AIMLOCK;   break;
            case 10: rebinding_verb = INPUT_VERB.PAUSE; break;
            case 11: rebinding_verb = INPUT_VERB.MAP;   break;
        }
            
        //Ensure we don't scan for vk_escape as that is used for the "pause" verb (which cancels rebinding)
        //input_binding_scan_params_set([vk_escape]);
            
        //Start binding. We specify some code to execute when a new binding is inputted by the player
        //We use the basic input_binding_set_safe() function here but input_binding_set() can be used too for more complex situations
        InputDeviceSetRebinding(_device, true);
    }
}

if (InputDeviceGetRebinding(_device))
{
    var _result = InputDeviceGetRebindingResult(_device);
    if (_result != undefined)
    {
        InputBindingSetSafe(InputDeviceIsGamepad(_device), rebinding_verb, _result);
        InputDeviceSetRebinding(_device, false);
    }
}

//B to return to menu
scrControls()
if kCancel
	room_goto(rmOptions)
if kMap
{
	InputBindingsReset(InputDeviceIsGamepad(_device))
	bitsound(sndPickup1Up)
}