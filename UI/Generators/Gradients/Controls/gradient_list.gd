extends Container
class_name GradientList
## A UI container specifically designed to display a list of gradients.
## This class is intended to hold visual representations of gradients,
## likely as child nodes (e.g., `TextureRect` with a `GradientTexture1D` or custom controls).
## It manages the layout and presentation of multiple gradients within a user interface.

@export var _size = Vector2(30, 30)

@onready var _gradients: Array[Gradient] = []


## Clears all color pickerscz from the list and resets the internal color array.
## This effectively removes all displayed colors from the UI.
func clear():
	_gradients.clear()
	for c in get_children():
		c.queue_free()

func add_gradient(gradient: Gradient):
	var gradient_button = GradientButton.new()
	RatUI.control_fill_horizontal(gradient_button)  # Assumes RatUI is a global utility
	gradient_button.custom_minimum_size = _size

	gradient_button.gradient = gradient
	add_child(gradient_button)

## Returns the array of gradients currently displayed in the list.
func get_gradients() -> Array[Gradient]:
	return _gradients