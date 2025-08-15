extends Node2D 

signal set_data;

enum CardAdminPhases{
	CARD_CHOISE,
	ACTION_CHOICE,
	LOCATION_CHOICE,
}

func _on_ready():
	pass



var admin_card_phase: CardAdminPhases;


func _on_AdminCardPlayed(data: AdminCardData):
	admin_card_phase = CardAdminPhases.ACTION_CHOICE;
	set_data.emit(data);
	print("set")
	
