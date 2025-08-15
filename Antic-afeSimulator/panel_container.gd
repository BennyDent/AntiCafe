extends PanelContainer

@onready var style_box = preload("res://PanelChoiceStyle.tres")

func OnChange(input: bool):
	print(input)
	if(input):
		add_theme_stylebox_override("panel",style_box)
	else:
		add_theme_stylebox_override("panel",StyleBox.new())
