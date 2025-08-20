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
		#$Area2D/CollisionShape2D.shape.size = Vector2(input.scale_x, input.scale_y)
		scale.y = input.scale_y;
		rotation = input.rotation;
		room_data = input;
	get:
		return room_data;

func _ready():
	$Area2D.enter_mouse.connect(on_enter_mouse)
	$Area2D.exit_mouse.connect(on_exit_mouse)
	$RedPawn.visible = false;


func _process(delta):
	if Input.is_action_pressed("left_mouse"):
		if is_mouse:
			if is_choice_status:
				card_location_choosen.emit(room_data.room_index)


func on_enter_mouse():
	is_mouse = true;
	
func on_exit_mouse():
	is_mouse = false;
