// #TODO: this needs to get absolutely NUKED. As it's used everywhere, we'll use this to read out of the global state as a workaround...
// Removing this function would break a lot of functions, so we have to work around stuff.
// This function sucks because it implicitly sets variables in the calling object's scope instead of just making it global

function scrControls()
{//controls
	
	kLeft = global._inputs[INPUT_VERB.LEFT];
	kRight = global._inputs[INPUT_VERB.RIGHT];
	kUp = global._inputs[INPUT_VERB.UP];
	kDown = global._inputs[INPUT_VERB.DOWN];

	kAttack = global._inputs_pressed[INPUT_VERB.ATTACK];
	kAttackHold = global._inputs[INPUT_VERB.ATTACK];
	kJump = global._inputs_pressed[INPUT_VERB.JUMP];
	kJumpRelease = global._inputs_released[INPUT_VERB.JUMP];
	
	kSubweapon = global._inputs_pressed[INPUT_VERB.SUBWEAPON];
	kDash = global._inputs[INPUT_VERB.DASH];
	
	kSwap = global._inputs_pressed[INPUT_VERB.SWAP];
	
	kAimLock = global._inputs[INPUT_VERB.AIMLOCK];

	kAccept= global._inputs_pressed[INPUT_VERB.ACCEPT];
	kCancel= global._inputs_pressed[INPUT_VERB.CANCEL];
	kPause= global._inputs_pressed[INPUT_VERB.PAUSE]; 
	kPauseHold= global._inputs[INPUT_VERB.PAUSE];
	kMap= global._inputs_pressed[INPUT_VERB.MAP];

	//tapping, for menus
	kLeftTap = global._inputs_pressed[INPUT_VERB.LEFT];
	kRightTap = global._inputs_pressed[INPUT_VERB.RIGHT];
	kUpTap = global._inputs_pressed[INPUT_VERB.UP];
	kDownTap = global._inputs_pressed[INPUT_VERB.DOWN];	
}