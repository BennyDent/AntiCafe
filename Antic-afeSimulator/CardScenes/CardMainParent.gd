extends Node2D
var is_change_y: bool = false;
var y_destination: float;
var rotation_destination: float;
var is_rotation: float = false;
var is_draggable: bool = true:
	get:
		return is_draggable;
	set(input):
		is_draggable = input;
		if(input):
			get_draggable_position();
			print(1);
		else:
			get_not_draggable_position();
			
# Called when the node enters the scene tree for the first time.


func _process(delta):
	if(is_change_y):
		if(y_destination> global_position.y):
			global_position.y = global_position.y+ (y_destination-global_position.y)*(delta*5);
		else:
			global_position.y = global_position.y- (global_position.y- y_destination)*(delta*5);
		if(global_position.y == y_destination):
			is_change_y= false;
	if(is_rotation):
		if(rotation_destination > rotation):
			global_rotation = global_rotation + (rotation_destination-global_rotation)*(delta*5)
		else:
			global_rotation = global_rotation - (global_rotation - rotation_destination)*(delta*5);
		if(global_rotation==rotation_destination):
			is_rotation = false;

func _ready():
	global_position.y =  get_viewport().get_visible_rect().size.y-scale.y/2;

func start_y_motion(input):
	y_destination = input;
	print(y_destination);
	is_change_y = true;

func start_rotation_motion(input):
	rotation_destination = input;
	is_rotation=true;

func get_draggable_position():
	var  bottom_position = get_viewport().get_visible_rect().size;
	start_y_motion( bottom_position.y - scale.y/2);
	
	start_rotation_motion(0.0)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func get_not_draggable_position():
	var new_global_position= get_viewport().get_visible_rect().size;
	
	
	start_rotation_motion(0.3);
	start_y_motion(new_global_position.y);
