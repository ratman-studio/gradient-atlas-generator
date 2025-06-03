extends HBoxContainer
class_name OptionButtonLabeled

var label:Label
var option_button:OptionButton

var value: int:
	get: return option_button.get_selected_id()
	set(v): option_button.select(v)

func _init():
	label = Label.new()
	add_child(label)

	option_button = OptionButton.new()
	add_child(option_button)
