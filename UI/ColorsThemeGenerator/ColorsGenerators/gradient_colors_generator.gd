extends ColorsGenerator
class_name Gradient_ColorGeneratorController

@export var _amount_slider: HSliderLabeled
@export var start_color:ColorPickerButton
@export var end_color:ColorPickerButton

func generate_colors_theme() -> Array[Color]:
	var amount = _amount_slider.value
	var start = start_color.color
	var end = end_color.color
	return RatColor.simple_gradient_color_theme_generator(amount, start, end)
