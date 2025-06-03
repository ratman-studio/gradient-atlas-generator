extends VBoxContainer

# Reference to the gradient texture
@export var gradient_color_rect: TextureRect
var gradient_texture: GradientTexture1D

@export_group("colors")
# Variables to store the selected colors
@export var color_pickers: Dictionary[ColorPickerButton, float]

func _ready():
	# Create the UI elements
	

	# Set up the gradient texture
	gradient_texture = GradientTexture1D.new()
	gradient_texture.gradient = Gradient.new()
	gradient_color_rect.texture = gradient_texture

	for color_picker_button in color_pickers.keys():
		color_picker_button.popup_closed.connect(_on_color_changed)
#		color_picker_button.color_changed.connect(_on_color_changed)
		color_picker_button.picker_created.connect(_on_color_changed)
	
	_update_gradient()
	
	
func _on_color_changed():
	# Update the gradient initially
	_update_gradient()



func _update_gradient():
	# Update the gradient with the selected colors
	var gradient = Gradient.new()
	
	for picker in color_pickers.keys():
		var position:float = color_pickers[picker]
		gradient.add_point(position, picker.color)
	
	gradient_texture.gradient = gradient
