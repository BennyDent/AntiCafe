extends Area2D

signal enter_mouse
signal exit_mouse


func _process(delta):
	if Rect2(global_position,$CollisionShape2D.get_shape().size).has_point(get_global_mouse_position()):
		enter_mouse.emit()
	else:
		exit_mouse.emit();
		print(false)
