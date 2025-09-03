extends Sprite2D

var texture_status: ActionFigures = ActionFigures.new();
var pawn_index: int;



func setTexture(pawn_type: int, worker_index: int ):
	texture =  texture_status.SetTexture(pawn_type,worker_index);
	
