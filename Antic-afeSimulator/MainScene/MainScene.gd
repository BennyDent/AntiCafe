extends Node2D

var actions_array: Array[Dictionary] = []
var buffer: Dictionary;
signal is_played;
var characters_actions = [0,0,0,0]
var turms_counter: int;
var actions: Array[Dictionary]= [];

func on_action_choosen():
	pass


func _ready():
	$"AdminCardController/Hand/Area2D/CollisionShape2D".card_played.connect(on_is_played)
	$AdminCardController.choose_action.connect($CanvasLayer/AdminActionChoice.setCardData)
	$CanvasLayer/AdminActionChoice.action_selected.connect($AdminCardController._on_Action_Choosen)
	$AdminCardController.choose_location.connect(_on_choose_location);
	$CanvasLayer/LocationChoose.location_choosen.connect();
	$CanvasLayer/LocationChoose.set_choosen.connect($RoomsController.SetLocationCardChoice)
	$RoomsController.set_pawn_visible.connect($CanvasLayer/LocationChoose.setActionPawnVisible)
	$CanvasLayer/LocationChoose.location_choosen.connect(_on_action_location_choosen)

func _on_choose_location(array:Array[String], worker_index: int):
	$CanvasLayer/AdminActionChoice.visible = false;
	$CanvasLayer/AdminActionChoice.mouse_filter = Control.MOUSE_FILTER_IGNORE
	print(array.size())
	$CanvasLayer/LocationChoose.InitializeBoxes(array, worker_index)
	$RoomsController.visible = true;
	$RoomsController.worker_index= worker_index;


func _on_action_location_choosen():
	pass


func on_is_played(data: CardData, worker: int):
	$RoomsController.visible = false;
	print("played3")
	buffer ={"worker": worker}
	characters_actions[worker]+=1;
	match data.card_type:
		data.CardType.ADMIN:
			print(5)
			$AdminCardController._on_AdminCardPlayed(data);
			
