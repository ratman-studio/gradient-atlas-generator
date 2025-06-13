extends AGradientsGenerator
class_name Pair_Gradients_Generator

@export var feed_type: OptionButtonWithLabel


func generate_gradients (colors: Array[Color]) -> Array[Gradient]:
	if not check_colors_array(colors):
		printerr("stop gradient generation")
		return []

	var color_pairs = RatUtils.chunk(colors, 2)

	var gradients: Array[Gradient]
	for pair in color_pairs:
		var typed_pair: Array[Color] = typed_array_color(pair)
		if typed_pair.size() > 1:
			var gradient = create_gradient(typed_pair)
			gradients.push_back(gradient)

	return gradients


func typed_array_color(array: Array) -> Array[Color]:
	var typed_array: Array[Color] = []
	for item in array:
		if item is Color:
			typed_array.append(item)
		else:
			printerr("Item in array is not a Color: ", item)

	return typed_array


func create_gradient(colors: Array[Color]) -> Gradient:
	var gradient    = Gradient.new() 	# creates black to white gradient with two points
	# clear gradient to start with empty one
	# check colors array size
	var amount: int = colors.size()
	if amount < 1:
		printerr("gradient cant have less than one color")
		return gradient # return default gradient

	# remove second color if only one color is provided
	if amount == 1: gradient.remove_point(1)

	# set or add new colors in equal intervals from 0 to 1
	for i in range(amount):
		var position = RatColor.equal_distribution(0, 1, i, amount)
		
		if gradient.get_point_count() <= i:
			gradient.add_point(position, colors[i])

		else:
			gradient.set_color(i, colors[i])
			gradient.set_offset(i, position)

	return gradient


func check_colors_array(colors: Array[Color]) -> bool:
	if colors.size() < 2:
		return false
		printerr("to genereate pair gradient we need at last two colors")
	return true


func clear_gradient(gradient: Gradient):
	print("--- Rozpoczęcie czyszczenia gradientu ---")
	print("Początkowa liczba punktów: ", gradient.get_point_count())

	var loop_count = 0
	while gradient.get_point_count() > 0:
		loop_count += 1
		print("Iteracja ", loop_count, ": Liczba punktów przed usunięciem: ", gradient.get_point_count())
		gradient.remove_point(0)
		print("Iteracja ", loop_count, ": Liczba punktów po usunięciu: ", gradient.get_point_count())

		# Dodaj limit iteracji, aby zapobiec zawieszeniu się edytora podczas debugowania
		if loop_count > 100: # Wystarczająco dużo, by zauważyć problem, ale nie zawiesić się na zawsze
			print("PRZERWANIE: Osiągnięto limit iteracji. Coś jest nie tak.")
			break

	print("--- Zakończono czyszczenie gradientu ---")
	print("Końcowa liczba punktów: ", gradient.get_point_count())
