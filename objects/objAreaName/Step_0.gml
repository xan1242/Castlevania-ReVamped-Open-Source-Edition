/// @description grow the bar
var expand_rate = 0.1

if bar_height < 1.0 && !shrink
{
	bar_height += expand_rate
	if (bar_height > 1.0)
		bar_height = 1.0
}

if shrink
{
	bar_height -= expand_rate
	if (bar_height < 0.0)
		bar_height = 0.0
}

if shrink && bar_height <= 0
	instance_destroy()