if !visible
	exit

scrControls()

if (kMap && !isWarpMap)
{
	global.map_exiting = true
	instance_destroy()
}