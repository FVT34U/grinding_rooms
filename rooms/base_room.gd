class_name BaseRoom extends Node2D


var _cells: Array[BaseRoomCell]
## Array of cells in the room, copy
var cells: Array[BaseRoomCell]:
	get: return _cells.duplicate()

var width: int: 
	get: return width

var height: int:
	get: return height

var room_shape: Vector2i:
	get: return room_shape

class BaseRoomCell extends Sprite2D:
	var idx := Vector2i.ZERO:
		get: return idx
	
	var type := RoomCellType.EMPTY:
		get: return type
		set(new_type): type = new_type
	
	func _init(idx: Vector2i, type: RoomCellType = RoomCellType.EMPTY) -> void:
		self.idx = idx
		self.type = type
		
		self.name = "Cell_%s_%s" % [str(self.idx.x), str(self.idx.y)]
		
		match type:
			RoomCellType.EMPTY: self.texture = GlobalParameters.empty_floor_texture
			RoomCellType.FLOOR: self.texture = GlobalParameters.base_floor_texture
			_: self.texture = GlobalParameters.empty_floor_texture
		
		var p_size = GlobalParameters.sprites_pixel_size
		self.position = Vector2(
			p_size * self.idx.x + p_size / 2,
			p_size * self.idx.y + p_size / 2,
		)

enum RoomCellType {
	EMPTY, # not for usage, make your own type for holes or something like that
	FLOOR,
	COLUMN,
	WALL,
	HOLE,
	LAVA,
	WATER,
	SPIKE,
	CRACKING_FLOOR,
}


func _init(width: int = 0, height: int = 0) -> void:
	self.width = width
	self.height = height
	
	self.room_shape = Vector2i(self.width, self.height)
	
	for j in range(0, self.height):
		for i in range(0, self.width):
			var cell = BaseRoomCell.new(Vector2i(i, j))
			self._cells.append(cell)
			add_child(cell)


## Returns a copy of room cell under given index
func get_cell_by_idx(idx: Vector2i) -> BaseRoomCell:
	if not _is_index_valid(idx): return null
	return self._cells[idx.y * self.width + idx.x]


## Sets a new value to room cell under given index
func set_cell_by_idx(idx: Vector2i, new_cell_type: RoomCellType = RoomCellType.EMPTY) -> bool:
	if not _is_index_valid(idx): return false
	
	var cell_name = "Cell_%s_%s" % [str(idx.x), str(idx.y)]
	#print(cell_name)
	var old_cell = get_node(cell_name)
	var new_cell = BaseRoomCell.new(idx, new_cell_type)
	
	old_cell.queue_free()
	
	new_cell.name = cell_name
	add_child(new_cell)
	
	self._cells[idx.y * self.width + idx.x] = new_cell
	return true


func _is_index_valid(idx: Vector2i) -> bool:
	if idx.x < 0 or idx.x >= self.width or idx.y < 0 or idx.y >= self.height: return false
	return true


func generate() -> bool:
	return false


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	pass
