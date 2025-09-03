extends PanelContainer

var focused = preload("res://StyleBoxStyles/LocationChoosePanel/Focused.tres")
var un_focused = preload("res://StyleBoxStyles/LocationChoosePanel/Unfocused.tres")

func SetStyleBox(input: bool):
	if(input):
		add_theme_stylebox_override("panel", focused)
	else:
		add_theme_stylebox_override("panel",un_focused)
	
