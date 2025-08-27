class_name Pawn extends CharacterBody2D


@export var pawn_team = PawnManager.Team.ENEMY

@onready var team_manager: PawnManager = get_parent()

@export var speed: float = 5000.0
var is_moving: bool = false

var _path: Array[Vector2i] = []
var path: Array[Vector2i]:
	set(value):
		if value.size() >= 2:
			_path = value
			is_moving = true
		else: printerr("Path must contain at least 2 points")
	get: return _path


func _get_path_next_point() -> Vector2i:
	if Vector2i(position.round()) == path[0]:
		return path.pop_front()
	return path[0]


func _get_moving_direction() -> Vector2:
	if path.is_empty():
		is_moving = false
		return Vector2.ZERO
	return position.direction_to(_get_path_next_point())


func _physics_process(delta: float) -> void:
	if is_moving:
		velocity = _get_moving_direction() * speed * delta
		move_and_slide()
