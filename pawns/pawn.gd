class_name Pawn extends CharacterBody2D


@export var pawn_team = PawnManager.TeamColor.RED

@onready var team_manager: PawnManager = get_parent()

@onready var sprite: Sprite2D = $Sprite2D

@export var speed: float = 200.0

var is_moving: bool = false

var end_point: Vector2i = Vector2i.ZERO

var _path: Array[Vector2i] = []
var path: Array[Vector2i]:
	set(value):
		if value.size() >= 2:
			_path = value
			end_point = value[-1]
			is_moving = true
		else: print("Warning: Path must contain at least 2 points")
	get: return _path


func set_active_glowing(value: bool):
	sprite.material.set_shader_parameter("enabled", value)


func _get_path_next_point() -> Vector2i:
	if (position - Vector2(_path[0])).length() <= 5.0: # just a magic number lol
		return _path.pop_front()
	return _path[0]


func _get_moving_direction() -> Vector2:
	if _path.is_empty():
		is_moving = false
		position = end_point
		return Vector2.ZERO
	return position.direction_to(_get_path_next_point())


func _physics_process(delta: float) -> void:
	if is_moving:
		velocity = _get_moving_direction() * speed
		move_and_slide()
