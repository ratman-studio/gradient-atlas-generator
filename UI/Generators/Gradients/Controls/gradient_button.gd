extends Button
class_name GradientButton

var gradient_texture: GradientTexture2D

func set_gradient(gradient: Gradient):
	if gradient == null:
		print("Cannot set gradient icon: provided gradient is null.")
		icon = null # Clear any existing icon
		return

	var width = 20
	var height = 20
	
	gradient_texture = GradientTexture2D.new()
	gradient_texture.gradient = gradient
	
	gradient_texture.width = width
	gradient_texture.height = height
	
	icon = gradient_texture
