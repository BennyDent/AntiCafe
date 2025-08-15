extends CardData


class_name AdminCardData
@export var first_action: ActionText;
@export var second_action: ActionText;
@export var additional_action: ActionText; 
@export var is_rest: bool;

func _init():
	card_type =CardType.ADMIN;
