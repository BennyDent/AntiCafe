extends Node2D
signal card_location_choosen;
signal location_choosen;
var is_choice_status: bool = false;
var is_mouse: bool = false;
enum Status{
OFF,
LOCATION_CARD_CHOICE,
LOCATION_CHOICE
}

enum ChoiceTexture{
OFF,
RED_MARK,
RED_PAWN
}
var choce_texture: ChoiceTexture = ChoiceTexture.OFF
var status: Status = Status.OFF

var room_data: RoomClass:
	set(input):
		
		global_position.x = input.global_position_x;
		global_position.y = input.global_position_y;
		scale.x =input.scale_x;
		print()
		$Area2D/CollisionShape2D.shape.size = input.shape_size;
		scale.y = input.scale_y;
		rotation = input.rotation;
		room_data = input;
		print($Area2D/CollisionShape2D.shape.size, room_data.room_index)
	get:
		return room_data;

func _ready():
	pass


func _process(delta):
	
	if Input.is_action_pressed("left_mouse"):
		print(is_mouse)
		if is_mouse:
			print(18, is_choice_status)
			if is_choice_status:
				card_location_choosen.emit(room_data.room_index);
				print(room_data.room_index)





func _on_area_2d_mouse_entered() -> void:
	print("fuck")
	is_mouse=true;
	print(is_mouse) # Replace with function body.


func _on_area_2d_mouse_exited() -> void:
	print("yes")
	is_mouse=false
	print(808) # Replace with function body.
