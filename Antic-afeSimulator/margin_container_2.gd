extends MarginContainer


var is_focus: bool = true;

signal set_focus;
signal set_choosen;

func _process(delta):
	if Rect2(global_position,size).has_point(get_global_mouse_position()):
		is_focus = true;
	else:
		is_focus = false;
	set_focus.emit(is_focus);
	if is_focus:
		if Input.is_action_just_pressed("left_mouse"):
			set_choosen.emit();
