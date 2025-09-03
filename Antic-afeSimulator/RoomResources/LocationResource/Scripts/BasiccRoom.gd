extends Resource



class_name BasicRoom
@export var is_toiler:bool = false;
@export var scale_x: float = 0.0;
@export var scale_y:float = 0.0;
@export var rotation: float = 0.0;
@export var global_position_x: float =0.0;
@export var global_position_y: float= 0.0;
var is_action: bool = false;

func _init() -> void:
	is_action = false;
