extends Container
class_name ColorThemeGenerators_Controller

## A UI controller responsible for managing the generation and display of color themes.
## It orchestrates the interaction between a generate button, color generators,
## and a display list for the generated colors.
##
## @property _generate_button: The button that triggers the color generation process.
## @property _colors_list: The ColorPickerList instance used to display the generated colors.
## @property _generators: The ColorsGenerators_Container instance that contains various color generation algorithms.


@export var _generate_button: Button
@export var _colors_list: ColorPickerList
@export var _generators: ColorsGenerators_Container


func _ready() -> void:
	_generate_button.pressed.connect(_generate_button_pressed)


func _generate_button_pressed():
	generate_colors_theme()


## Generates a new set of colors using the configured generators and updates the display list.
## It first requests colors from the "_generators" container. If successful, it clears
## the "_colors_list" and populates it with the newly generated colors.
## Prints an error if color generation fails.

func generate_colors_theme():
	var colors = _generators.generate_colors()
	if colors != null:
		update_item_list(colors)
	else:
		printerr("error - colors not generated")


## Updates the displayed list of colors.
## Clears the existing colors in the "_colors_list" and then adds each color from the
## provided array to the list for display.
## @param colors An Array of Color objects to be displayed.

func update_item_list(colors: Array[Color]):
	_colors_list.clear()

	for c in colors:
		_colors_list.add_color(c)

		#RatUI.control_fill_vertical(picker)
		
	
