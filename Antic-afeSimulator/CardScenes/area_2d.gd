extends Area2D


func _ready():
	input_pickable = true;


func _on_mouse_entered():
	get_parent().is_draggable = true;
	print(2)
	
func _on_mouse_exited():
	get_parent().is_draggable = false;
