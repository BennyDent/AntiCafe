extends Node2D

var actions_array: Array[Dictionary] = []
var buffer: Dictionary;
signal is_played;
var characters_actions = [0,0,0,0]
var turms_counter: int;


func on_action_choosen():
	pass


func _ready():
	$"Hand/Area2D/CollisionShape2D".card_played.connect(on_is_played)
	$AdminCardController.set_data.connect($CanvasLayer/AdminActionChoice.setCardData)
	#$CanvasLayer/LocationChoose.set_choosen.connect()

func on_is_played(data: CardData, worker: int):
	$RoomScene.visible = false;
	print("played3")
	buffer ={"worker": worker}
	characters_actions[worker]+=1;
	match data.card_type:
		data.CardType.ADMIN:
			print(5)
			$AdminCardController._on_AdminCardPlayed(data);
			
