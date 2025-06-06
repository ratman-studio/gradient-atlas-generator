extends Container
class_name ColorPickerList

## A custom UI control that displays a list of color pickers.
## Each color in the list is represented by a `ColorPickerButton`, allowing
## users to view and potentially modify the colors.
##
## @property _size: The desired size (width, height) for each individual `ColorPickerButton` in the list.
## @property _colors: An internal array storing the `Color` objects currently displayed in the list.
@export var _size = Vector2(30, 30)

@onready var _colors: Array[Color] = []


## Clears all color pickers from the list and resets the internal color array.
## This effectively removes all displayed colors from the UI.

func clear():
	_colors.clear()
	for c in get_children():
		c.queue_free()


## Adds a new color to the list.
## A new `ColorPickerButton` is created, configured with the provided color,
## and added as a child to this container. The color is also added to the
## internal `_colors` array.
## @param color The Color object to add to the list.
func add_color(color: Color):
	var picker = ColorPickerButton.new()
	RatUI.control_fill_horizontal(picker)  # Assumes RatUI is a global utility
	picker.custom_minimum_size = _size

	picker.color = color
	add_child(picker)


## Returns the array of colors currently displayed in the list.
## @return An Array of Color objects.
func get_colors() -> Array[Color]:
	return _colors
	
