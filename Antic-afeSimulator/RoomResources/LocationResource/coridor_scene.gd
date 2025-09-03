extends Node2D


var room_data: BasicRoom:
	set(input):
		global_position.x = input.global_position_x;
		global_position.y = input.global_position_y;
		scale.x =input.scale_x;
		#$Area2D/CollisionShape2D.shape.size = Vector2(input.scale_x, input.scale_y)
		scale.y = input.scale_y;
		$Sprite2D.scale.x = input.scale_x;
		$Sprite2D.scale.y = input.scale_y;
		rotation = input.rotation;
		room_data = input;
	get:
		return room_data;
