extends Node
class_name RatUI
## RatUI - a framework to easily build interfaces from code in Godot Engine.
## This class provides static methods to create and configure common UI controls,
## simplifying UI construction without relying heavily on the editor.
## version 0.0.3
## - added comments to RatUI

# Default anchor preset for newly created controls, set to fill the parent container.
static var default_anchor_preset: int = Control.PRESET_FULL_RECT

# Predefined size for a medium-sized window.
static var WINDOW_SIZE_MID: Vector2:
	get: return Vector2(400, 300)


#region Simple Controls
# Creates a new Window control.
# @param parent The parent Node to which the window will be added.
# @return The newly created Window instance.
static func window(parent: Node) -> Window:
	var control = Window.new()
	control.min_size = RatUI.WINDOW_SIZE_MID
	control.close_requested.connect(control.hide)

	parent.add_child(control)
	control.popup_centered()

	return control

# Creates a new HBoxContainer.
# @return The newly created HBoxContainer instance.
static func hBox() -> HBoxContainer:
	var control: HBoxContainer = HBoxContainer.new()
	control_fill_horizontal(control)

	return control

# Creates a new VBoxContainer.
# @return The newly created VBoxContainer instance.
static func vBox() -> VBoxContainer:
	var control = VBoxContainer.new()
	control_fill_vertical(control)

	return control

# Creates a new Label control.
# @param label_text The text to display on the label.
# @return The newly created Label instance.
static func label(label_text) -> Label:
	var control = Label.new()
	control.text = label_text

	control_fill_horizontal(control)

	return control

# Creates a new EditorResourcePicker control.
# @param resoure_type The base type of resource to be picked (e.g., "Texture2D").
# @param label An optional Label node to be added to the picker (e.g., for RTL layout).
# @return The newly created EditorResourcePicker instance.
static func resource_picker(resoure_type: String, label = null) -> EditorResourcePicker:
	var control: EditorResourcePicker = EditorResourcePicker.new()
	control.base_type = resoure_type
	control_fill_horizontal(control)

	if label:
		control.add_child(label)

		control.set_layout_direction(Control.LAYOUT_DIRECTION_RTL)

	return control


#endregion



# Creates a custom LineEditLabeled control.
# @param label_text The text for the label part.
# @param line_edit_text The initial text for the LineEdit part.
static func line_edit_labeled(label_text: String, line_edit_text: String) -> LineEditLabeled:
	var control: LineEditLabeled = LineEditLabeled.new()
	control_fill_horizontal(control)

	control.label.text = label_text
	control_fill_horizontal(control.label)

	control.line_edit.text = line_edit_text
	control_fill_horizontal(control.line_edit)

	return control

# Creates a custom OptionButtonLabeled control.
# @param label_text The text for the label part.
# @param options An array of strings or values to populate the OptionButton.
# @return The newly created OptionButtonLabeled instance.
static func option_button_labeled(label_text: String, options: Array) -> OptionButtonLabeled:
	var control: OptionButtonLabeled = OptionButtonLabeled.new()
	control_fill_horizontal(control)

	control.label.text = label_text
	control_fill_horizontal(control.label)

	control_fill_horizontal(control.option_button)
	for option in options:
		control.option_button.add_item(str(option))

	return control

# Creates a custom EditorResourcePickerLabeled control.
# @param label_text The text for the label part.
# @param resoure_type The base type of resource for the picker (e.g., "Script").
# @return The newly created EditorResourcePickerLabeled instance.
static func editor_resource_picker_labeled(label_text: String, resoure_type: String) -> EditorResourcePickerLabeled:
	var control: EditorResourcePickerLabeled = EditorResourcePickerLabeled.new()
	control_fill_horizontal(control)

	control.label.text = label_text
	control_fill_horizontal(control.label)

	control_fill_horizontal(control.control)
	control.control.base_type = resoure_type

	return control

# Creates a custom DirectorySelectorLabeled control.
# @param label_text The text for the label part.
# @param value The initial path for the directory selector.
# @return The newly created DirectorySelectorLabeled instance.
static func dir_selector_labeled(label_text: String, value: String) -> DirectorySelectorLabeled:
	#TODO: do not set value in new
	var control: DirectorySelectorLabeled = DirectorySelectorLabeled.new(value)
	control_fill_horizontal(control)

	control.label.text = label_text
	control_fill_horizontal(control.label)
	control_fill_horizontal(control.control)

	return control

# Creates a custom Vector2iLabeled control.
# @param label_text The text for the label part.
# @param value The initial Vector2i value.
# @return The newly created Vector2iLabeled instance.
static func vector2i_labeled(label_text: String, value: Vector2i) -> Vector2iLabeled:
	var control: Vector2iLabeled = Vector2iLabeled.new()

	control_fill_horizontal(control)
	control_fill_horizontal(control.control_x)
	control_fill_horizontal(control.control_y)
	control_fill_horizontal(control.label)

	control.value = value
	control.label.text = label_text
	return control

# Creates a custom HSliderLabeled control.
# @param label_text The text for the label part.
# @param value The initial integer value for the slider.
# @return The newly created HSliderLabeled instance.
static func slider_h_labeled(label_text: String, value: int) -> HSliderLabeled:
	var control: HSliderLabeled = HSliderLabeled.new()

	control_fill_horizontal(control)
	control_fill_horizontal(control.control)
	control_fill_horizontal(control.label)
	control_fill_horizontal(control.label_value)

	control.value = value
	control.label.text = label_text
	return control


#region Layout Helpers

#region Layout Helpers

# Configures a Control to fill available horizontal space within its parent.
# @param control The Control node to configure.
static func control_fill_horizontal(control: Control):
	control.set_anchors_preset(RatUI.default_anchor_preset)
	control.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	control.size_flags_vertical = Control.SIZE_EXPAND

# Configures a Control to fill available vertical space within its parent.
# @param control The Control node to configure.
static func control_fill_vertical(control: Control):
	control.set_anchors_preset(RatUI.default_anchor_preset)
	control.size_flags_horizontal = Control.SIZE_EXPAND

	#endregion
