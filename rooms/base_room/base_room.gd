class_name BaseRoom extends TileMapLayer

var width: int:
	get: return width

var height: int:
	get: return height


func _init(width: int = 10, height: int = 10) -> void:
	tile_set = load("res://rooms/base_room/base_room_tileset.tres")
	
	self.width = width
	self.height = height
	
	for j in range(0, height):
		for i in range(0, width):
			set_cell(Vector2i(i, j), 0, Vector2i(0, 0), 0)

func generate() -> bool:
	return false
