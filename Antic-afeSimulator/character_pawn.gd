extends TextureRect


var texture_status: ActionFigures = ActionFigures.new();




func SetTexture(pawn_type: int, worker_index: int ):
	texture =  texture_status.SetTexture(pawn_type, worker_index);
	
