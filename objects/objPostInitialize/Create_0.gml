show_debug_message("PostInitialize...");

if (!gc_is_enabled())
{
    gc_enable(true);
}

unload_all_ingame_assets();

var oldtvfilter_setting = false
if ds_map_find_value(global.options,"crt") != undefined
	oldtvfilter_setting = ds_map_find_value(global.options,"crt")

set_crt_filter(oldtvfilter_setting)
