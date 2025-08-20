extends MarginContainer

signal set_focus;


func _process(delta):
	if Rect2(global_position,size).has_point(get_global_mouse_position()):
		set_focus.emit(true);
	else:
		set_focus.emit(false);
		print(false)


		
