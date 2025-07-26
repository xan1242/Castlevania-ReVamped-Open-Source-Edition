persistent = true;
depth = -250

// #TODO this could be optimized to save memory on array sizes
// however, this is the fastest way without having to dereference keys, so 1:1 mapping to the enum is way faster
global._inputs = array_create(INPUT_VERB.VERB_COUNT, false);
global._inputs_pressed = array_create(INPUT_VERB.VERB_COUNT, false);
global._inputs_released = array_create(INPUT_VERB.VERB_COUNT, false);

_InputCheckList = array_create(0);
_InputPressList = array_create(0);
_InputReleaseList = array_create(0);

array_push(_InputCheckList, INPUT_VERB.UP);
array_push(_InputCheckList, INPUT_VERB.DOWN);
array_push(_InputCheckList, INPUT_VERB.LEFT);
array_push(_InputCheckList, INPUT_VERB.RIGHT);
array_push(_InputCheckList, INPUT_VERB.PAUSE);
array_push(_InputCheckList, INPUT_VERB.ATTACK);
array_push(_InputCheckList, INPUT_VERB.DASH);
array_push(_InputCheckList, INPUT_VERB.AIMLOCK);

array_push(_InputPressList, INPUT_VERB.UP);
array_push(_InputPressList, INPUT_VERB.DOWN);
array_push(_InputPressList, INPUT_VERB.LEFT);
array_push(_InputPressList, INPUT_VERB.RIGHT);
array_push(_InputPressList, INPUT_VERB.ACCEPT);
array_push(_InputPressList, INPUT_VERB.CANCEL);
array_push(_InputPressList, INPUT_VERB.PAUSE);
array_push(_InputPressList, INPUT_VERB.MAP);
array_push(_InputPressList, INPUT_VERB.JUMP);
array_push(_InputPressList, INPUT_VERB.ATTACK);
array_push(_InputPressList, INPUT_VERB.SUBWEAPON);
array_push(_InputPressList, INPUT_VERB.SWAP);

array_push(_InputReleaseList, INPUT_VERB.JUMP);



function Update()
{
	var check_len = array_length(_InputCheckList);
	for (var i = 0; i < check_len; i++)
	{
		var v = _InputCheckList[i];
		global._inputs[v] = InputCheck(v) != 0;
	}
	
	var press_len = array_length(_InputPressList);
	for (var i = 0; i < press_len; i++)
	{
		var v = _InputPressList[i];
		global._inputs_pressed[v] = InputPressed(v);
	}
	
	var release_len = array_length(_InputReleaseList);
	for (var i = 0; i < release_len; i++)
	{
		var v = _InputReleaseList[i];
		global._inputs_released[v] = InputReleased(v);
	}
	
	if (INPUT_ON_MOBILE)
	{
		global._inputs_pressed[INPUT_VERB.ATTACK] |= global.vbutton_cancel.Pressed() != 0;	
		global._inputs[INPUT_VERB.ATTACK] |= global.vbutton_cancel.Check() != 0;
		global._inputs_pressed[INPUT_VERB.JUMP] |= global.vbutton_accept.Pressed() != 0;	
		global._inputs_released[INPUT_VERB.JUMP] |= global.vbutton_accept.Released() != 0;
	}
}
