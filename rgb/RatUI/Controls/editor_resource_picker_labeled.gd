extends HBoxContainer
class_name EditorResourcePickerLabeled

signal resource_changed(res:Resource)

var label:Label
var editor_resource_picker:EditorResourcePicker

var control:EditorResourcePicker:
	get: return editor_resource_picker
	set(value): editor_resource_picker = value

var value: Variant:
	get: return control.get_edited_resource()
	set(v): control.set_edited_resource(v)

func _init():
	label = Label.new()
	add_child(label)

	control = EditorResourcePicker.new()
	add_child(control)

	control.resource_changed.connect(func(res:Resource): resource_changed.emit(res))

func set_resource(variant:Resource):
	editor_resource_picker.set_edited_resource(variant)
