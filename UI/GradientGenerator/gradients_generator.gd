extends Container

@export var generate_button:Button
@export var generators:GradientGenerator_Container
@export var color_picker_list: ColorPickerList

@export var gradine_list: GradientList

func _ready() -> void:
	generate_button.pressed.connect(_generate_gradient_button_pressed)

func _generate_gradient_button_pressed():
		generate_gradients()


func generate_gradients():
	var colors = generators.generate_gradients(color_picker_list.get_colors())
	if colors != null:
		update_item_list(colors)
	else:
		printerr("error - colors not generated")

	
func update_item_list(colors:Array[Color]):
	for c in gradine_list.get_children():
		c.queue_free()
	var size = Vector2(30,30)
	
	for c in colors:
		var picker = ColorPickerButton.new()
		RatUI.control_fill_horizontal(picker)
		picker.custom_minimum_size = size
		
		#RatUI.control_fill_vertical(picker)
		picker.color = c
		gradine_list.add_child(picker)
	
