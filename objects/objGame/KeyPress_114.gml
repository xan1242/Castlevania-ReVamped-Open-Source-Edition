if (!debug_mode)
	exit

surface_resize(application_surface, 1280, 720);
display_set_gui_size(1280, 720)
window_set_size(1280, 720)
texturegroup_set_mode(true, true)
global.debug_ui_active = true
