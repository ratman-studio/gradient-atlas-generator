extends HBoxContainer
class_name DirectorySelectorLabeled


signal directory_changed(path:String)


var label:Label
var control:Label
var button:Button

var value: String


func _init(dir: String):
	_create_design()
	_register_signals()

	value = dir
	control.text = value


func _create_design():
	label = Label.new()
	add_child(label)

	control = Label.new()
	add_child(control)

	button = Button.new()
	button.text = "Change"
	add_child(button)

	control.size_flags_stretch_ratio = 0.9
	button.size_flags_stretch_ratio = 0.1


func _register_signals():
	button.pressed.connect(_on_button_pressed)


func _on_button_pressed():
	# show file dialgo
	var file_dialog:FileDialog = FileDialog.new()
	file_dialog.size = RatUI.WINDOW_SIZE_MID
	file_dialog.file_mode = FileDialog.FILE_MODE_OPEN_DIR
	file_dialog.dir_selected.connect(_on_file_selected)
	add_child(file_dialog)

	file_dialog.popup_centered()
	file_dialog.show()

func _on_file_selected(path:String):
	#TODO: check if exist and show warning
	value = path
	control.text = path
	directory_changed.emit(path)
