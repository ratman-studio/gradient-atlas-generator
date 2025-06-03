extends HBoxContainer
class_name HSliderLabeled

signal changed

@export
var label:Label
@export
var control:HSlider
@export
var label_value:Label

var value: float:
	get: return control.value
	set(v): 
		control.value = v
		label_value.text = str(v)

func _ready():
	register_signals()
	
	
func register_signals():	
	label_value.text = str(int(control.value))
	control.value_changed.connect(_on_slider_changed)

func _on_slider_changed(v:float):
	label_value.text = str(int(v))
	changed.emit(v)
	
