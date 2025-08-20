extends Control
var is_timer: bool= false;
var timer: float = 100.00
signal action_selected
@onready var strong =$"MarginContainer/PanelContainer/BoxContainer/MarginContainer/Strong Action/Additionoal";
@onready var additional=$"MarginContainer/PanelContainer/BoxContainer/MarginContainer/Strong Action/Main";
@onready var first=$"MarginContainer/PanelContainer/BoxContainer/MarginContainer2/VBoxContainer/FirstAction";
@onready var second=$"MarginContainer/PanelContainer/BoxContainer/MarginContainer2/VBoxContainer/SecondAction";
var visible_setter:
	set(input):
		if(input):
			is_timer = true;
			timer = 20.00;
			mouse_filter  = MOUSE_FILTER_STOP;
		visible_setter = input;
		visible = input;
var data: AdminCardData
var second_margin_container: bool = false:
	set(input):
		$MarginContainer/PanelContainer/BoxContainer/MarginContainer2/PanelContainer.OnChange(input)
		second_margin_container = input;
	get:
		return second_margin_container
var first_margin_container: bool= false:
	set(input):
		$MarginContainer/PanelContainer/BoxContainer/MarginContainer/PanelContainer.OnChange(input)
		first_margin_container = input;
	get:
		return first_margin_container
func _ready():
	mouse_filter = Control.MOUSE_FILTER_PASS
	visible = false;
	$"MarginContainer/PanelContainer/BoxContainer/MarginContainer".set_focus.connect(set_focus_1)
	$MarginContainer/PanelContainer/BoxContainer/MarginContainer2.set_focus.connect(set_focus_2)


func _process(delta):
	if(is_timer):
		timer -= delta;
		if(timer<0):
			is_timer = false;
			mouse_filter = MOUSE_FILTER_IGNORE
	if Input.is_action_pressed("left_mouse"):
		if(is_timer):
			print(timer)
			return;
		if(first_margin_container):
			action_choosen()
		if(second_margin_container):
			action_choosen()
			


func action_choosen():
	var action;
	if(first_margin_container==true and second_margin_container==false):
		action = {"type": "strong", 1:strong.data.action_string,2: additional.data.action_string}
	elif(first_margin_container==false and second_margin_container==true):
		action = {"type": "strong", 1:first.data.action_string,2: second.data.action_string}
	action_selected.emit(action);


func setCardData(set_data: AdminCardData):
	print(3434)
	visible = true;
	is_timer = true;
	timer = 0.50
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	strong.data =set_data.additional_action;
	additional.data = set_data.first_action
	first.data = set_data.first_action
	second.data = set_data.second_action
	

func set_focus_1(input: bool):
	
	if input:
		if(second_margin_container== false):
			first_margin_container = true;
	else:
		first_margin_container = false;
	
func set_focus_2(input: bool):
	
	if input:
		if(first_margin_container== false):
			second_margin_container = true;
	else:
		second_margin_container = false;



func _on_margin_container_mouse_exited() -> void:
	first_margin_container = false; # Replace with function body.


func _on_margin_container_2_mouse_exited() -> void:
	second_margin_container = false; # Replace with function body.
