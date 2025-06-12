extends Button
class_name GradientButton

func set_gradient(gradient: Gradient):
	if gradient == null:
		print("Cannot set gradient icon: provided gradient is null.")
		icon = null # Clear any existing icon
		return

	var width = 20
	var height = 20
	
	var gradient_texture = GradientTexture1D.new()
	gradient_texture.gradient = gradient

	# To make it visible as a button icon, we often need to render it into an ImageTexture
	# as GradientTexture1D itself doesn't have a direct "size" property like ImageTexture.
	# For button icons, Godot typically expects a Texture2D that can be drawn directly.
	# Let's create an Image and draw the gradient onto it.

	var image = Image.new()
	image.create(width, height, false, Image.FORMAT_RGBA8)
	image.fill(Color(0,0,0,0)) # Transparent background

	# Draw the gradient onto the image. This requires iterating pixels or using a shader,
	# but for simplicity, we'll leverage a Viewport to render the texture.
	# This is a common pattern when you need a renderable image from a procedural texture.

	# Create a temporary SubViewport and TextureRect to render the gradient
	var sub_viewport = SubViewport.new() # Używamy SubViewport zamiast Viewport
	sub_viewport.transparent_bg = true
	sub_viewport.size = Vector2(width, height)

	add_child(sub_viewport) # Add to scene tree temporarily


	var texture_rect = TextureRect.new()
	texture_rect.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	texture_rect.stretch_mode = TextureRect.STRETCH_SCALE
	texture_rect.texture = gradient_texture
	texture_rect.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	sub_viewport.add_child(texture_rect)


	# Force an update to render the texture
	# Używamy call_deferred, aby upewnić się, że SubViewport miał szansę się wyrenderować
	call_deferred("set_icon_after_render", sub_viewport)

func set_icon_after_render(sub_viewport: SubViewport):
	# Sprawdzamy, czy sub_viewport nadal istnieje i nie został zwolniony
	if not is_instance_valid(sub_viewport):
		printerr("SubViewport already freed or invalid.")
		return

	var viewport_texture = sub_viewport.get_texture()
	if viewport_texture:
		# Get the image data from the viewport texture
		var new_image = viewport_texture.get_image()
		if new_image.is_empty():
			printerr("Failed to get image from viewport texture. Image is empty.")
			# Opcjonalnie możesz tutaj ustawić domyślną ikonę lub błąd
		else:
			var image_texture = ImageTexture.new()
			image_texture.create_from_image(new_image)
			self.icon = image_texture
	else:
		printerr("Failed to get texture from sub_viewport.")

	# Clean up temporary nodes
	sub_viewport.queue_free()
