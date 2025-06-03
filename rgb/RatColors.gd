class_name RatColor
## A utility class for color manipulation and generation in Godot Engine.
## Provides tools for creating color themes, gradients, and color space conversions.
## @version 1.0.0
## @author ratman.studio

## Generates an array of colors forming a gradient between two colors.
## @param amount The number of colors to generate
## @param start The starting color
## @param end The ending color
## @return Array of colors forming the gradient
static func simple_gradient_color_theme_generator(amount:int, start:Color, end:Color) -> Array[Color]:
	var colors: Array[Color]
	for i in range(amount):
		var color = equal_distribution(start, end, i, amount)
		colors.append(color)
		
	return colors

## Performs linear interpolation between two values.
## @param start Starting value
## @param end Ending value
## @param index Current index
## @param size Total number of steps
static func equal_distribution(start, end, index:float, size:float):
	return lerp(start, end, index/(size-1))

## Generates an array of random colors.
## @param amount The number of colors to generate
## @return Array of random colors
static func random_color_theme_generator(amount:int) -> Array[Color]:
	var colors: Array[Color]
	for i in range(amount):
		var color = generate_random_color()
		colors.append(color)
		
	return colors

## Generates a single random color in HSV color space.
## @return A random color
static func generate_random_color() -> Color:
	randomize()
	return Color.from_hsv(randf(), randf(), randf())

## Generates a similar color by modifying HSV values within specified ranges.
## @param color The base color
## @param abberation Maximum deviation for each component (H,S,V)
## @return A similar color
static func generate_similar_color_hsv(color:Color, abberation:Vector3 = Vector3(0.1, 0.1, 0.1) ) -> Color:
	var hsv: Vector3 = Color2hsv(color)
	var h = randf_range(hsv.x - abberation.x, hsv.x + abberation.x)
	h = _normalize_hue(h)
	
	var s = randf_range(hsv.y- abberation.y, hsv.y + abberation.y)
	var v = randf_range(hsv.z- abberation.z, hsv.z + abberation.z)
	
	return Color.from_hsv(h,s,v)


## Converts a color from RGB to HSV color space.
## Implementation based on: https://www.easyrgb.com/en/math.php#text20
## @param color The color to convert
## @return Vector3 representing HSV values (x=hue, y=saturation, z=value)
static func Color2hsv(color: Color) -> Vector3:

	var max = max(color.r, max(color.g, color.b));
	var min = min(color.r, min(color.g, color.b));
	var del_max = max - min

	# Handle grayscale case
	var value = max;
	var hue = 0
	var saturation = 0

	# Handle chromatic case
	if del_max != 0:
		saturation = del_max / max
		var half_delta_max = del_max/2
		
		var del_r = ((max - color.r) / 6 + half_delta_max) / del_max
		var del_g = ((max - color.g) / 6 + half_delta_max) / del_max
		var del_b = ((max - color.b) / 6 + half_delta_max) / del_max
		
		if   color.r == max: hue = del_b - del_g
		elif color.g == max: hue = (1/3) + del_r - del_b
		elif color.b == max: hue = (2/3) + del_g - del_r
	
		hue = _normalize_hue(hue)
		
	return Vector3(hue, saturation, value)

## Normalizes the hue value to be within [0,1] range.
## @param hue The hue value to normalize
## @return Normalized hue value
static func _normalize_hue(hue:float) :
	if hue < 0: return hue + 1
	if hue > 1: return hue - 1
	return hue
	
