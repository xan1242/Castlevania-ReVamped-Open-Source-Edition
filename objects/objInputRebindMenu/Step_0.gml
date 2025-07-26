///@description Only allow the player to navigate the menu if we're not rebinding anything
var _device = InputPlayerGetDevice();
if (!InputDeviceGetRebinding(_device))
{
    //Move the menu selection up and down, example for how to use 'opposing' checkers
    menu_selection += InputOpposingRepeat(INPUT_VERB.UP, INPUT_VERB.DOWN);
        
    //Make sure we wrap around the menu
    menu_selection = (menu_selection + 2) mod 2;
        
    //Start the rebinding process when the player selects an option
    if (InputPressed(INPUT_VERB.ACCEPT))
    {
        switch(menu_selection)
        {
            case 0: rebinding_verb = INPUT_VERB.ACCEPT;   break;
            case 1: rebinding_verb = INPUT_VERB.CANCEL;  break;
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
        //Rebind the jump verb once we get a response
        InputBindingSetSafe(InputDeviceIsGamepad(_device), rebinding_verb, _result);

        //Make sure we turn off rebinding once a binding has been found
        InputDeviceSetRebinding(_device, false);
    }
}

//B to return to menu
scrControls()
if kPause
	room_goto(rmOptions)
if kMap
{
	InputBindingsReset(InputDeviceIsGamepad(_device))
	bitsound(sndPickup1Up)
}