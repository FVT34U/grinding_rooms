class_name NavigationManager extends Node

var astar: AStarGrid2D

@export var tilemap: TileMapLayer = null


func _ready() -> void:
	astar = AStarGrid2D.new()
	astar.region = tilemap.get_used_rect()
	astar.cell_size = Vector2(32, 32)
	astar.diagonal_mode = astar.DIAGONAL_MODE_NEVER
	#obstacles
	astar.update()


func _input(event: InputEvent) -> void:
	if event is InputEventMouse and event.is_action_pressed("left_click"):
		var end_point = event.position
		var start_point = %Pawn.position
		var arr = []
		var path = astar.get_point_path(
			astar.get_point_position(Vector2i(start_point)),
			astar.get_point_position(Vector2i(end_point))
		)
		for el in path:
			arr.append(Vector2i(el))
		%Pawn.path = arr
