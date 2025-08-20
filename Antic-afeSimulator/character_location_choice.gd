extends VBoxContainer
signal action_choosen
var is_action_choosen:bool= false;
var index:int;
@onready var character_pawn = $MarginContainer/CharacterPawn;
@onready var action_panel = $MarginContainer2/PanelContainer;
@onready var action_label = $MarginContainer2/Label;
@onready var action_container = $MarginContainer2
func _ready():
	action_container.set_focus.connect(focus_set)
	action_container.set_choosen.connect(ActionChoosen)



func initializeAction(action_string, worker_index):
	character_pawn.visible = true;
	visible = true;
	action_label = action_string
#нстроить выбор скрипта в зависимости от рабочего


func ActionUnchoosen():
	is_action_choosen = false

func ActionChoosen():
	is_action_choosen = true;
	action_choosen.emit(index)

func focus_set(input):
	
	if input or is_action_choosen:
		action_panel.self_modulate = Color("grey")
		action_panel.OnChange(true);
	else:
		action_panel.self_modulate = Color("black")
		action_panel.OnChange(false);
