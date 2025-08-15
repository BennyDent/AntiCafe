extends Resource

class_name CardData

enum CardType{
	ADMIN,
	MANAGER,
	MOOD,
	GUEST,
	EVENT
}
@export var card_image: Texture2D;

var card_type: CardType;
