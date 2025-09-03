extends Node2D
var action_index: int = 0;
var worker_index: int = 0
enum Status{
OFF,
LOCATION_CARD_CHOICE,
LOCATION_CHOICE
}
@onready var sprite = preload("res://RoomResources/LocationResource/PawnSprite.tscn")
var status: Status = Status.OFF
signal set_pawn_visible



func SetLocationCardChoice(actionIndex:int):
	action_index = actionIndex;
	print('fdfdfdf')
	status= Status.LOCATION_CARD_CHOICE;
	for child in get_children():
		if "is_choice_status" in child:
			child.is_choice_status= true;
			print("who")





func ReturnLocations():
	pass


func InitializeRooms():
	
	var corridor_load = load("res://RoomResources/LocationResource/CoridorScene.tscn")
	var room_load = load("res://RoomResources/LocationResource/RoomScene.tscn")
	var location_resources = ResourceLoader.load("res://RoomResources/LocationResource/Rooms.tres");
	for room in location_resources.rooms:
		var new_room;
		print(room.is_action)
		
		if(room.is_action):
			print(room.room_index);
			new_room = room_load.instantiate();
			new_room.card_location_choosen.connect(SetLocationChoosen);
			PawnInit(room.room_index, Vector2(room.global_position_x, room.global_position_y),0,0);
			PawnInit(room.room_index, Vector2(room.global_position_x, room.global_position_y),0,1);
		else:
			new_room = corridor_load.instantiate()
		add_child(new_room);
		new_room.room_data = room;
		
		
		
func _ready():
	InitializeRooms();

func SetLocationChoosen(index: int):
	$Pawns.SetVisible(false, action_index, worker_index);
	$Pawns.SetVisibleAt(true, index, action_index, worker_index);
	print("heart")
	set_pawn_visible.emit(false);


func PawnInitArray(room_index: int, room_position: Vector2):
	for i in range(4):
		for b in range(3):
			PawnInit(room_index, room_position, i ,b);

func PawnInit(room_index: int, room_position: Vector2, worker:int, type:int):
	
	var new_texture = sprite.instantiate();
	$Pawns.add_child(new_texture);
	new_texture.setTexture(type, worker);
	new_texture.pawn_index = room_index;
	new_texture.scale.x = 0.5;
	new_texture.scale.y = 0.5
	new_texture.z_index = 5;
	new_texture.global_position = room_position;
	new_texture.visible = false;
