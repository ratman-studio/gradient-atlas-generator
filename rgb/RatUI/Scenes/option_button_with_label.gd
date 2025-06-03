extends HBoxContainer
class_name OptionButtonWithLabel

signal changed(string:String)

@export var control:OptionButton

enum test {ONE,TWO,THREE}
	
func _ready():	register_signals()
		
func register_signals(): control.item_selected.connect(_on_slider_changed)

func _on_slider_changed(v:String): 	changed.emit(v)
	
