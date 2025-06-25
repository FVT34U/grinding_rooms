class_name GameManager extends Node2D

var current_room: BaseRoom
var room_counter := 0


func _init():
	var rng = RandomNumberGenerator.new()
	if GlobalParameters.rng_seed != "default":
		rng.seed = hash(GlobalParameters.rng_seed)
	
	var room = CircleRoom.new(25, 25)
	room.name = "Room_%s" % [room_counter]
	
	if not room.generate(): return
	
	add_child(room)
	current_room = room
	room_counter += 1


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	pass
