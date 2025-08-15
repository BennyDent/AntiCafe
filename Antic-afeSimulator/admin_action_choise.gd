extends Control
var is_timer: bool;
var timer: float = 50.00
var visible_setter:
	set(input):
		if(input):
			is_timer = true;
			timer = 5.00;
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
	visible = false;


func _process(delta):
	if(is_timer):
		timer -= delta;
		if(timer<0):
			is_timer = false;
			mouse_filter = MOUSE_FILTER_IGNORE
	if Input.is_action_pressed("left_mouse"):
		if(first_margin_container):
			print("choosed");
		if(second_margin_container):
			print("choosed")
			

func setCardData(set_data: AdminCardData):
	print(3434)
	visible_setter = true;
	$"MarginContainer/PanelContainer/BoxContainer/MarginContainer/Strong Action/Additionoal".data =set_data.additional_action;
	$"MarginContainer/PanelContainer/BoxContainer/MarginContainer/Strong Action/Main".data = set_data.first_action
	$"MarginContainer/PanelContainer/BoxContainer/MarginContainer2/VBoxContainer/FirstAction".data = set_data.first_action
	$"MarginContainer/PanelContainer/BoxContainer/MarginContainer2/VBoxContainer/SecondAction".data = set_data.second_action
	



func _on_margin_container_2_mouse_entered() -> void:
	print("bbbbb")
	if(first_margin_container== false):
		first_margin_container = true; # Replace with function body.


func _on_margin_container_mouse_entered() -> void:
	print("bbbbb")
	if(second_margin_container== false):
		second_margin_container = true; # Replace with function body.


func _on_margin_container_mouse_exited() -> void:
	first_margin_container = false; # Replace with function body.


func _on_margin_container_2_mouse_exited() -> void:
	second_margin_container = false; # Replace with function body.
