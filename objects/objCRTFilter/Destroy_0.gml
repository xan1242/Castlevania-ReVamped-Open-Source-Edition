application_surface_draw_enable(true);

if (surface_exists(global.bufferLastFrame))
	surface_free(global.bufferLastFrame)
if (surface_exists(global.bufferSurface[0]))
	surface_free(global.bufferSurface[0])
if (surface_exists(global.bufferSurface[1]))
	surface_free(global.bufferSurface[1])