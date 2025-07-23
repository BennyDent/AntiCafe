extends CollisionShape2D
var positions_array = []
@export  var first = 200.00;
@export var shift = 50.00;
func _ready():
	for i in range(12):
		positions_array.append(first + (float((i+1))*shift)) ;
	var results = get_children();
	for  i in range(get_children().size()):
		results[i].global_position.x = positions_array[i];
