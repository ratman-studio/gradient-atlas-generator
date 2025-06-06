extends TabContainer
class_name GradientsGenerators_Container

func generate_gradients(colors:Array[Color]) -> Array[Color]:
	var current = get_current_tab_control()
	return current.generate_gradient()
	
	
func get_current_generator() -> Object:
	return get_current_tab_control()
