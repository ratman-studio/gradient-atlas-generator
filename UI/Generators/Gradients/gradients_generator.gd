extends Container

@export var generate_button:Button
@export var generators:GradientsGenerators_Container
@export var color_picker_list: ColorPickerList

@export var gradient_list: GradientList

func _ready() -> void:
	generate_button.pressed.connect(_generate_gradient_button_pressed)

func _generate_gradient_button_pressed():
		generate_gradients()


func generate_gradients():
	var gradients = generators.generate_gradients(color_picker_list.get_colors())
	if gradients != null:
		update_item_list(gradients)
	else:
		printerr("error - colors not generated")

	
func update_item_list(gradients:Array[Gradient]):
	for g in gradient_list.get_children():
		g.queue_free()
	var size = Vector2(30,30)
	
	for g in gradients:
		var picker = GradientButton.new()
		RatUI.control_fill_horizontal(picker)
		picker.custom_minimum_size = size
		
		#RatUI.control_fill_vertical(picker)
		picker.set_gradient(g)
		gradient_list.add_child(picker)
	
