extends Node2D

enum Status{
OFF,
LOCATION_CARD_CHOICE,
LOCATION_CHOICE
}

var status: Status = Status.OFF


func SetLocationCardChoice():
	status= Status.LOCATION_CARD_CHOICE;
	

func InitializeRooms():
	var room_load = load("res://RoomResources/LocationResource/RoomScene.tscn")
	var location_resources = ResourceLoader.load("res://RoomResources/LocationResource/Rooms.tres");
	for room in location_resources.rooms:
		var new_room = room_load.instantiate();
		add_child(new_room);
		new_room.room_data = room;
		
func _ready():
	InitializeRooms();
