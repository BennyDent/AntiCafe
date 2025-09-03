extends VBoxContainer
signal action_choosen
var is_action_choosen:bool= false;
var action_type:int;
@onready var character_pawn = $MarginContainer/CharacterPawn;
@onready var action_panel = $MarginContainer2/PanelContainer;
@onready var action_label = $MarginContainer2/Label;
@onready var action_container = $MarginContainer2


func _ready():
	action_container.set_focus.connect(focus_set)
	action_container.set_choosen.connect(ActionChoosen)
	mouse_filter = Control.MOUSE_FILTER_IGNORE;



func initializeAction(action_string: String, worker_index: int, action_index: int):
	action_type = action_index
	character_pawn.visible = true;
	character_pawn.SetTexture(action_index, worker_index);
	visible = true;
	action_label.text = action_string
#нстроить выбор скрипта в зависимости от рабочего


func ActionUnchoosen():
	is_action_choosen = false

func ActionChoosen():
	is_action_choosen = true;
	action_choosen.emit(action_type)

func focus_set(input):
	if(input==false and is_action_choosen==true):
		action_panel.SetStyleBox(true);
	else:
		action_panel.SetStyleBox(input);
	
	
func SetPawnVisible(input: bool):
	$MarginContainer/CharacterPawn.visible = input;

	
