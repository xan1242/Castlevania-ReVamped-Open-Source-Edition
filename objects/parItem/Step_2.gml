/// @description physics for falling + invisible when hidden
scrPhysics()
visible = !place_meeting(x,y,parSolid)
	
xspeed *= 0.9