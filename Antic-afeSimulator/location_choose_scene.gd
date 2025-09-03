extends Control
var choosen_index: int;
signal location_choosen
var addChild = preload("res://CharacterLocationChoice.tscn") 
signal set_choosen
enum SpriteType{
	PAWN,
	TOWER,
	OFFICER
}





func InitializeBoxes(arrays: Array[String], worker_index: int):
	var counter =0;
	print(arrays.size())
	$MarginContainer/Button.visible = true;
	for array in arrays:
		var new_scene = addChild.instantiate();
		$HBoxContainer.add_child(new_scene);
		new_scene.initializeAction(array, worker_index,counter );
		new_scene.action_choosen.connect(ActionChoosen)
	
		counter+=1;
		
	print(counter,"fdfddff");
		
		
		
		
func setActionPawnVisible(input: bool):
	for child in $HBoxContainer.get_children():
		if child.is_action_choosen == true:
			child.SetPawnVisible(input)

func ActionChoosen(index: int):
	for children in $HBoxContainer.get_children():
		if children.action_type!=index:
			children.is_action_choosen=false;
			children.focus_set(false);
	set_choosen.emit(index)
func _ready():
	#mouse_filter= Control.MOUSE_FILTER_IGNORE
	$MarginContainer/Button.visible = false
	mouse_filter = Control.MOUSE_FILTER_PASS


func _on_button_pressed() -> void:
	var is_active = true;
	for child in $HBoxContainer.get_children():
		if child.is_action_choosen==false:
			is_active=false;
	location_choosen.emit()
	# Replace with function body.
