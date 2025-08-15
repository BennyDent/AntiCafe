extends CollisionShape2D
var positions_array = []
@export var cards_scale =150;
var dictionary = {1: 5,2: 5, 3:5, 4:4, 5:4, 6: 3,}
var rotations_positions = [-0.040, -0.030,  -0.020, -0.010, -0.0, 0.010, 0.020, 0.030, 0.040, 0.050  ]
@export  var first = 100.00;
@export var shift = 50.00;
var first_index: int;
var last_index: int;
enum HandIndex{
FIRST,
SECOND,
THIRD,
FOURTH
}
@onready var first_preload = preload("res://CardStatusresources/First.tres");
@onready var second_preload = preload("res://CardStatusresources/Second.tres");

var hand_index: HandIndex
func ReturnHandIndex(hand_index):

	var result = get_children().filter(func(a): return a.hand_index==hand_index);
	if result.size()>0:
		return result[0]
	else:
		return;


func InitializeCardsStart(cards: Array[CardData],set_hand_index: int):
	var cards_array: Array[CardData];
	hand_index = set_hand_index;
	match hand_index:
		HandIndex.FIRST:
			cards_array = first_preload.hand
		HandIndex.SECOND:
			cards_array = second_preload.hand
	Cardsinitialization(cards);

func Cardsinitialization(cards: Array[CardData]):
	var start = dictionary[cards.size()];
	first_index = start;
	last_index = start+ cards.size();
	for  i in range(cards.size()):
		
		var to_change = cards[i]
		to_change.set_draggable.connect(_on_emit_signal);
		to_change.move_card.connect(_on_card_move);
		to_change.start_position_x = positions_array[start+i];
		to_change.global_position.x = positions_array[start+i];
		to_change.hand_index = start+i;
		to_change.rotation =  rotations_positions[start+i];
		to_change.shape_size = get_shape().size;


func _ready():
	for i in range(12):
		
		positions_array.append((float((i+1)*cards_scale)));
	
func _on_card_move(from_hand_index, to_hand_index):
	if(from_hand_index> to_hand_index):
		if(from_hand_index>first_index):
			moving_hand(from_hand_index, from_hand_index-1, false);
			moving_hand(to_hand_index, to_hand_index+1, true);
	elif(from_hand_index< to_hand_index):
		if(from_hand_index<last_index):
			moving_hand(from_hand_index, from_hand_index+1, false)
			moving_hand(to_hand_index, to_hand_index-1, true)

func moving_hand(hand_index, int_to_move, is_move):
	var to_move = ReturnHandIndex(hand_index);
	if(is_move):
		to_move.start_x_motion(positions_array[int_to_move])
	to_move.start_position_x = positions_array[int_to_move];
	to_move.hand_index = int_to_move;


func _on_emit_signal(hand_index, is_dragged):
	var results = get_children();
	
	for i in range(results.size()):
		if results[i].hand_index != hand_index:
			results[i].is_draggable = is_dragged;
		
