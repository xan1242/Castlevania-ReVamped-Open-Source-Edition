/// @description error failsafe values

// #TODO yeet these, use variable definitions directly instead!
// this was very stupidly coded, so we're keeping these for backwards compatibility...
tx = targetX
ty = targetY
troom = targetRoom

if global.boss_rush
	instance_create(x-4,y,objAreaDoor)