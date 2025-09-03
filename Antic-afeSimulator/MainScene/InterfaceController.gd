extends Node2D 
var card_data: AdminCardData;
signal choose_action;
signal choose_location;
@onready var hand= $Hand/Area2D/CollisionShape2D;
var buffer_action: Dictionary;
enum CardAdminPhases{
	CARD_CHOISE,
	ACTION_CHOICE,
	LOCATION_CHOICE,
}
var admin_card_phase: CardAdminPhases;
func _on_ready():
	pass




func ActionSubmit():
	pass



func _on_Action_Choosen(input: Dictionary):
	buffer_action = input;
	if(admin_card_phase==CardAdminPhases.LOCATION_CHOICE):
		return
	admin_card_phase = CardAdminPhases.LOCATION_CHOICE;
	var array: Array[String] = []
	if(input["type"]== "strong"):
		array.append(card_data.first_action.action_text +"\n+\n"+card_data.additional_action.action_text)
		print(card_data.first_action.action_text,card_data.additional_action.action_text)
	else :
		array.append(card_data.first_action.action_text)
		array.append(card_data.second_action.action_text)
	print(hand.hand_index)
	choose_location.emit(array, hand.hand_index);
	
func CancelAction():
	admin_card_phase = CardAdminPhases.CARD_CHOISE;
	hand.SetCardsVisibility(true);
	
	

func _on_AdminCardPlayed(data: AdminCardData):
	admin_card_phase = CardAdminPhases.ACTION_CHOICE;	
	choose_action.emit(data);
	card_data = data;
	print("set")
	
	
