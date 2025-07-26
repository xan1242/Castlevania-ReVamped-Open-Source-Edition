enum SIMPLEPLAT
{
	UNK = -1,
	DESKTOP,
	MOBILE,
	WEB,
	CONSOLE,
	TV
}

function simple_platform_detect()
{
	if (os_browser != browser_not_a_browser)
		return SIMPLEPLAT.WEB
	
	if (os_device != device_ios_unknown)
		return SIMPLEPLAT.MOBILE
	
	switch (os_type)
	{
		case os_linux:
		case os_macosx:
		case os_windows:
			return SIMPLEPLAT.DESKTOP
		
		case os_gxgames:
			return SIMPLEPLAT.WEB
			
		case os_ps4:
		case os_ps5:
		case os_gdk:
		case os_switch:
			return SIMPLEPLAT.CONSOLE
		
		case os_tvos:
		case os_ios:
		case os_android:
			return SIMPLEPLAT.TV
				
		default:
			return SIMPLEPLAT.UNK
	}
}