extends Resource
class_name ColorArray

var _colors: Array[Color]

func get_colors():
	return _colors
	
func add_color(color:Color):
	_colors.append(color)
	
func clear():
	_colors.clear()
