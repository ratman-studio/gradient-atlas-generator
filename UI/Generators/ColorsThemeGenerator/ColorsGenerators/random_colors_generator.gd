extends ColorsGenerator
class_name Random_ColorsGeneratorController

@export var _amount_slider: HSliderLabeled

func generate_colors_theme() -> Array[Color]:
	var amount = _amount_slider.value
	return RatColor.random_color_theme_generator(amount)
		
	
	
