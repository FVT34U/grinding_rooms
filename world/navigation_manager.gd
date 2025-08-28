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
	
	for cell in obstacle_tilemap.get_used_cells():
		astar.set_point_solid(cell)
	astar.update()


func get_pawn_path(from: Vector2, to: Vector2) -> Array[Vector2i]:
	var start_point: Vector2i = tilemap.local_to_map(from)
	var end_point: Vector2i = tilemap.local_to_map(to)
	
	if end_point == start_point: return []
	
	var path: Array[Vector2i] = []
	var raw_path = astar.get_point_path(
		start_point,
		end_point
	)
	
	if not raw_path.is_empty():
		for el in raw_path:
			path.append(Vector2i(el) + Vector2i(16, 16))
	
	return path
