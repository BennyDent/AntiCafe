extends Resource

class_name ActionFigures

var textures = [[load("res://9666685b9268675a89445ef04e898ba4 (2).png"),load("res://chess-3-32.png")]]

enum WorkerIndex{
	FIRST,
	SECOND,
	THIRD,
	FOURTH
}
var pawn_status:PawnType = PawnType.PAWN;
var worker_status: WorkerIndex = WorkerIndex.FIRST
enum PawnType{
	PAWN,
	ROOK,
	OFFICER
}


func SetTexture(pawn_type: int, worker_index: int ):
	print(worker_index, pawn_type)
	pawn_status = pawn_type;
	worker_status = worker_index;
	return textures[worker_index][pawn_type];
