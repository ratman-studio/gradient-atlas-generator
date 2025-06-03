extends HBoxContainer
class_name Vector2iLabeled

signal value_changed(value:Vector2i)


var label:Label

var control_x:SpinBox
var control_y:SpinBox

var _value:Vector2i

var value:Vector2i:
	get: return _value;
	set(v):
		print ("set Vector2i labeled %s" % str(v))
		_value = v
		control_x.set_value_no_signal(v.x)
		control_y.set_value_no_signal(v.y)
		value_changed.emit(_value)


func _init():
	_create_design()
	register_signals()


func _create_design():
	print ("Vector2i create design %s" % str(value))
	label = Label.new()
	add_child(label)

	control_x = _add_new_control()
	control_y = _add_new_control()


func _add_new_control() -> SpinBox:
	var node:SpinBox = SpinBox.new()
	add_child(node)
	node.size_flags_stretch_ratio = .5
	return node


func register_signals():
	print ("Vector2i register %s" % str(value))
	control_x.value_changed.connect(_on_control_changed)
	control_y.value_changed.connect(_on_control_changed)


func _on_control_changed(_v:float) -> void:
	var X: float = control_x.value
	var Y: float = control_y.value

	var Xchanged: bool = _value.x != X
	var Ychanged: bool = _value.y != Y

	if !Xchanged and !Ychanged: return

	if Xchanged: _value.x = X
	if Ychanged: _value.y = Y

	print ("Vector2i emit %s" % str(value))
	value_changed.emit(value)
