extends Container
class_name ColorThemeGenerators_Controller

@export var _generate_button: Button
@export var _colors_list:ColorPickerList
@export var _generators:ColorsGenerators_Container

func _ready() -> void:
	_generate_button.pressed.connect(_generate_button_pressed)

func _generate_button_pressed():
		generate_colors_theme()


func generate_colors_theme():
	var colors = _generators.generate_colors()
	if colors != null:
		update_item_list(colors)
	else:
		printerr("error - colors not generated")

	
func update_item_list(colors:Array[Color]):
	_colors_list.clear()
	
	for c in colors:
		_colors_list.add_color(c)
		
		#RatUI.control_fill_vertical(picker)
		
	
