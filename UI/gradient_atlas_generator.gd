extends Panel



func _ready() -> void:
	var hbox:HBoxContainer = RatUI.hBox()
	var resolution_slider:HSliderLabeled = RatUI.slider_h_labeled("Resolution", 32)
	
	hbox.add_child(resolution_slider)
	add_child(hbox)
