extends TabContainer
class_name GradientGenerator_Container

func generate_colors() -> Array[Color]:
	var current = get_current_tab_control()
	return current.generate_gradient()
	
	
func get_current_generator() -> Object:
	return get_current_tab_control()
