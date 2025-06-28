class_name GameManager extends Node2D

var current_room: BaseRoom
var room_counter := 0


func get_room_center_coords() -> Vector2:
	return current_room.get_room_center_coords()


func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	if Globals.rng_seed != "default":
		rng.seed = hash(Globals.rng_seed)
	
	var room = RectRoom.new(48, 27)
	room.name = "Room_%s" % [room_counter]
	
	if not room.generate(): return
	
	add_child(room)
	current_room = room
	room_counter += 1


func _process(_delta: float) -> void:
	pass
