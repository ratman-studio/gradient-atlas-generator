extends TabContainer
class_name Generators_Container

func generate_colors() -> Array[Color]:
	var current = get_current_tab_control()
	if current is ColorGeneratorController:
		return current.generate_colors_theme()
	return []

	
	
func get_current_generator() -> Object:
	return get_current_tab_control()
