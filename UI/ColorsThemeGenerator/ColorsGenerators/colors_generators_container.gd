extends TabContainer
class_name ColorsGenerators_Container

func generate_colors() -> Array[Color]:
	var current = get_current_tab_control()
	if current is ColorsGenerator:
		return current.generate_colors_theme()
	return []

	
	
func get_current_generator() -> Object:
	return get_current_tab_control()
