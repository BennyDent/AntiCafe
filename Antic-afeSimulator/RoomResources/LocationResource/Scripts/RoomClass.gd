extends BasicRoom


class_name RoomClass
@export var room_index: int;
@export var is_admin: bool = false;
@export var shape_size: Vector2 ;
@export var pawn_scale: Vector2;
func _init():
	is_action = true;
