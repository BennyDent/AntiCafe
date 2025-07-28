extends Node2D
signal set_draggable
signal move_card
var is_change_y: bool = false;
var start_position_y: float = 0-scale.y/4.00;
var start_position_x: float;
var hand_index: int;
var rotation_undraggable_position: float;
var x_undraggable_position: float;
var y_destination: float;
var rotation_destination: float;
var is_rotation: float = false;
var is_moved: bool = false;
var is_played: bool = false;
var is_change_x: bool = false;
var x_destination: float;
var is_draggable = true;
var is_dragged: bool = true:

	get:
		return is_dragged;
	set(input):
		is_dragged = input;
		if(input):
			if(is_draggable):
				get_draggable_position();
				
			
		else:
			get_not_draggable_position();
			
# Called when the node enters the scene tree for the first time.


func _process(delta):
	if(is_change_y):
		if(y_destination> position.y):
			position.y = position.y+ (y_destination-position.y)*(delta*5);
		else:
			position.y = position.y- (position.y- y_destination)*(delta*5);
		if(position.y == y_destination):
			is_change_y= false;
			
	if is_change_x:
		if(x_destination> global_position.x):
			global_position.x = global_position.x+ (x_destination-global_position.x)*(delta*5);
		else:
			global_position.x = global_position.x- (global_position.x- x_destination)*(delta*5);
		if(global_position.x == x_destination):
			is_change_x= false;
	if(is_rotation):
		if(rotation_destination > rotation):
			rotation = rotation + (rotation_destination-rotation)*(delta*5)
		else:
			rotation = rotation - (rotation - rotation_destination)*(delta*5);
		if(rotation==rotation_destination):
			is_rotation = false;
	if is_dragged and Input.is_action_just_pressed("left_mouse"):
		is_moved= true;
		set_draggable.emit(hand_index, false);
	if is_moved:
		if Input.is_action_pressed("left_mouse"):
			global_position = get_global_mouse_position();
			if start_position_x-global_position.x <0 or start_position_x-global_position.x >scale.x:
				move_card.emit(hand_index+1);
		if Input.is_action_just_released("left_mouse"):
			is_moved = false;
			set_draggable.emit(hand_index, true);
			if is_played:
				pass
			else:
				is_dragged= false;
					


func _on_area_exited():
	is_played== true;



func _ready():
	start_position_y = start_position_y - float(hand_index)*10.00;
	position.y = start_position_y;

func start_y_motion(input):
	y_destination = input;
	print(y_destination);
	is_change_y = true;
	
	
func start_x_motion(input):
	x_destination = input;
	is_change_x = true;

func start_rotation_motion(input):
	rotation_destination = input;
	is_rotation=true;

func get_draggable_position():
	
	var  bottom_position = get_viewport().get_visible_rect().size;
	start_y_motion( start_position_y -20.00 );
	z_index = 13;
	start_rotation_motion(0.0);
# Called every frame. 'delta' is the elapsed time since the previous frame.
func get_not_draggable_position():
	
	var new_global_position= get_viewport().get_visible_rect().size;
	z_index = hand_index;
	start_rotation_motion(rotation_undraggable_position);
	start_y_motion(start_position_y);
	if(position.x !=start_position_x):
		start_x_motion(start_position_x);


func _on_area_2d_mouse_entered():
	is_dragged = true;
	print(is_draggable);# Replace with function body.


func _on_area_2d_mouse_exited():
	is_dragged=false;
	print(is_draggable);
	 # Replace with function body.
