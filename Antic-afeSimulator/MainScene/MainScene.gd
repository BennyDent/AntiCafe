extends Node2D



signal is_played

var turms_counter: int;



func _ready():
	$"Hand/Area2D/CollisionShape2D".card_played.connect(IsPlayed)
	$AdminCardController.set_data.connect($CanvasLayer/AdminActionChoice.setCardData)

func IsPlayed(data: CardData):
	print("played3")
	match data.card_type:
		data.CardType.ADMIN:
			print(5)
			$AdminCardController._on_AdminCardPlayed(data);
			
