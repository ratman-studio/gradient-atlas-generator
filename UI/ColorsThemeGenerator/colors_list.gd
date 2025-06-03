extends Container
class_name ColorPickerList
@export var _size = Vector2(30,30)
@onready var _colors:Array[Color] = []

func clear():
	_colors.clear()
	for c in get_children():
		c.queue_free()	

func add_color(color:Color):	
	var picker = ColorPickerButton.new()
	RatUI.control_fill_horizontal(picker)
	picker.custom_minimum_size = _size
	
	picker.color = color
	add_child(picker)

func get_colors() -> Array[Color]:
	return _colors
	
