extends Node2D



func ReturnActionIndex():
	for child in get_children():
		if child.visible==true:
			pass




func SetVisible(input: bool,  type: int, worker: int ):

	for children in get_children():
		print(children.texture_status.pawn_status,children.texture_status.worker_status)
		if children.texture_status.pawn_status==type and children.texture_status.worker_status==worker:
			children.visible = input;
			print("shit", children.visible)
		
		
		
func SetVisibleAt(input: bool, index:int, type: int, worker:int ):
	for children in get_children():
		print(children.texture_status.pawn_status,children.texture_status.worker_status)
		
		if children.pawn_index==index:
			if children.texture_status.pawn_status==type and children.texture_status.worker_status==worker:
				children.visible = input 
				print("shit", children.visible)
			else:
				children.visible= false;
		
