/// @description save it?
ds_map_replace(global.options,"controls_kbm",InputBindingsExport(false))
ds_map_replace(global.options,"controls_gp",InputBindingsExport(true))
ds_map_secure_save(global.options,"Castlevania_Options.sav")