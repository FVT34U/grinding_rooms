class_name GameManager extends Node2D

@export var player_scene: PackedScene
var player: Player

var current_room: BaseRoom
var room_counter := 0

@onready var astar: AStarPathfinding = AStarPathfinding.new()


func get_room_center_coords() -> Vector2:
	return current_room.get_room_center_coords()

func get_room_center_cell_coords() -> Vector2:
	return current_room.get_room_center_cell_coords()


func _ready() -> void:
	var rng = Globals.get_rng()
	
	var room = RectRoom.new(48, 27)
	room.name = "Room_%s" % [room_counter]
	
	if not room.generate(): return
	
	add_child(room)
	current_room = room
	room_counter += 1
	
	astar.setup_astar(room)
	
	player = player_scene.instantiate()
	player.position = get_room_center_cell_coords()
	add_child(player)


func _process(_delta: float) -> void:
	pass
