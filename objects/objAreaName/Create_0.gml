/// @description setup
depth = -146
alarm[0] = 240

bar_height = 0
text = ""
shrink = false


switch(global.area)
{
	case 0:
		text = "Entrance Hall"
	    break;
	case 1:
		text = "Torture Lab"
	    break;
	case 2:
		text = "Underground Mine"
	    break;
	case 3:
		text = "Castle Ruins"
	    break;
	case 4:
		text = "Catacombs"
	    break;
	case 5:
		text = "Castle Courtyard"
	    break;
	case 6:
		text = "Tower Bridge"
	    break;
	case 7:
		text = "Toy Room"
	    break;
	case 8:
		text = "Dungeon"
	    break;
	case 9:
		text = "Marble Gallery"
	    break;
	case 10:
		text = "Clock Tower"
	    break;
	case 11:
		text = "Castle Keep"
	    break;
	case 13:
		text = "Boss Rush"
	    break;
	default:
		text = "Unknown Area"
		break;
}

var bar_ypadding = 4
var font_leading_adjust = 1
var text_height = get_text_height(fntHUD, text)

text_base_x = 0
text_base_y = 48

bar_base_x = text_base_x
bar_base_y = text_base_y - (bar_ypadding / 2) + font_leading_adjust
bar_base_ysize = text_height + (bar_ypadding / 2)

