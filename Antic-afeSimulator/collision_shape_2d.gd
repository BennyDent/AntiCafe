extends CollisionShape2D
var positions_array = []
@export var cards_scale =150;
var dictionary = {1: 5,2: 5, 3:5, 4:4, 5:4, 6: 3,}
var rotations_positions = [-0.040, -0.030,  -0.020, -0.010, -0.0, 0.010, 0.020, 0.030, 0.040, 0.050  ]
@export  var first = 100.00;
@export var shift = 50.00;


func ReturnHandIndex(hand_index):

	var result = get_children().filter(func(a): return a.hand_index==hand_index);
	if result.size()>0:
		return result[0]
	else:
		return;

func _ready():
	for i in range(12):
		
		positions_array.append((float((i+1)*cards_scale)));
	var results = get_children();
	var start = dictionary[results.size()]
	for  i in range(get_children().size()):
		
		var to_change = results[i]
		get_parent().area_exited.connect(to_change._on_area_exited);
		to_change.set_draggable.connect(_on_emit_signal);
		to_change.move_card.connect(_on_card_move);
		to_change.start_position_x = positions_array[start+i];
		to_change.global_position.x = positions_array[start+i];
		to_change.hand_index = start+i;
		to_change.rotation =  rotations_positions[start+i];
	

func _on_card_move(hand_index):
	var to_move = ReturnHandIndex(hand_index);
	
	if to_move != null:
		to_move.start_x_motion(positions_array[hand_index-1])
		to_move.start_position_x = positions_array[hand_index-1];
		to_move.hand_index = hand_index-1;
		print(to_move.hand_index);
	var moved = ReturnHandIndex(hand_index-1);
	if moved != null:
		moved.start_position_x = positions_array[hand_index];
		moved.hand_index = hand_index;

func _on_emit_signal(hand_index, is_dragged):
	var results = get_children();
	
	for i in range(results.size()):
		if results[i].hand_index != hand_index:
			results[i].is_draggable = is_dragged;
		
