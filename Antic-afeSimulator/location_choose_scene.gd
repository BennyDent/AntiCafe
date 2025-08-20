extends Control
var choosen_index: int;
var addChild = preload("res://CharacterLocationChoice.tscn") 
signal set_choosen
func InitializeBoxes(arrays: Array[String], worker_index: int):
	var counter =0;
	for array in arrays:
		var new_scene = addChild.instantiate();
		add_child(new_scene);
		new_scene.initializeAction(array, worker_index);
		new_scene.action_choosen.connect(ActionChoosen)
		new_scene.index= counter;
		counter+=1;
		
		
		
func ActionChoosen(index: int):
	choosen_index = index;
	set_choosen.emit(index)
func _ready():
	mouse_filter = Control.MOUSE_FILTER_PASS
