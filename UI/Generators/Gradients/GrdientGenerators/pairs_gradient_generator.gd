extends MarginContainer
class_name Pair_Gradients_Generator

@export var feed_type:OptionButtonWithLabel


func generate_gradients (colors:Array[Color]) -> Array[Gradient]:
	if not check_colors_array(colors):
		printerr("stop gradient generation")
		return []
		
	var color_pairs = RatUtils.chunk(colors,2)
	
	var gradients:Array[Gradient] 
	for pair in color_pairs:
		if pair.size > 1:
			gradients.append(create_gradient(pair))	
	
	return gradients
	
func create_gradient(colors : Array[Color]) -> Gradient:
	var gradient = Gradient.new()
	var amount = colors.size()
	for i in range(amount):
		var position = RatColor.equal_distribution(0.0, 1.0, i, amount)
		gradient.add_point(position,colors[i])
	
	return gradient
		
func check_colors_array(colors:Array[Color]) -> bool:
	if colors.size() < 2:
		printerr("to genereate pair gradient we need at last two colors")
		return false
	return true
