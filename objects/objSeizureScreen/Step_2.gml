/// @description move on
scrControls()

if kAccept or kCancel or kPause or kMap or timedout
{
	instance_create(x,y,objFadeOutShutter)
	room_goto(rmPostInit)
}