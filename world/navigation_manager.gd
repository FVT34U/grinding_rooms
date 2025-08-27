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
	
	EnhancedInput.left_click.connect(_on_left_click)


func _on_left_click(event):
	var end_point: Vector2i = tilemap.local_to_map(event.position)
	var start_point: Vector2i = tilemap.local_to_map(%Pawn.position)
	
	if end_point == start_point: return
	
	var arr: Array[Vector2i] = []

	var path = astar.get_point_path(
		start_point,
		end_point
	)
	
	if not path.is_empty():
		for el in path:
			arr.append(Vector2i(el) + Vector2i(16, 16))
		%Pawn.path = arr
