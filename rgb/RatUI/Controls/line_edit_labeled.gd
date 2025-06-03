extends HBoxContainer
class_name LineEditLabeled

var label:Label
var line_edit:LineEdit

var value: String:
	get: return line_edit.text
	set(v): line_edit.text = v

func _init():
	label = Label.new()
	line_edit = LineEdit.new()

	add_child(label)
	add_child(line_edit)
