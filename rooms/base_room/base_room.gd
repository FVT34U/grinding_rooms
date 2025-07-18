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


func get_room_center_coords() -> Vector2:
	var x = float(self.width) / 2 * Globals.sprites_pixel_size
	var y = float(self.height) / 2 * Globals.sprites_pixel_size
	
	return Vector2(x, y)


func get_room_center_cell_coords() -> Vector2:
	return map_to_local(local_to_map(get_room_center_coords()))
