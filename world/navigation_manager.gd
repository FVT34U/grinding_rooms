class_name NavigationManager extends Node

var astar: AStarGrid2D

@export var tilemap: TileMapLayer = null
@export var obstacle_tilemap: TileMapLayer = null


func _ready() -> void:
	astar = AStarGrid2D.new()
	astar.region = tilemap.get_used_rect()
	astar.cell_size = Vector2(32, 32)
	astar.diagonal_mode = astar.DIAGONAL_MODE_NEVER
	astar.update()
	#TODO: add obstacles
	for cell in obstacle_tilemap.get_used_cells():
		astar.set_point_solid(cell)
	astar.update()


func _input(event: InputEvent) -> void:
	if event is InputEventMouse and event.is_action_pressed("left_click"):
		var end_point = event.position
		var start_point = %Pawn.position
		var arr: Array[Vector2i] = []

		var path = astar.get_point_path(
			tilemap.local_to_map(start_point),
			tilemap.local_to_map(end_point)
		)
		
		if not path.is_empty():
			for el in path:
				arr.append(Vector2i(el) + Vector2i(16, 16))
			%Pawn.path = arr
