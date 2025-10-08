class_name Pawn extends CharacterBody2D


@export var pawn_team = PawnManager.Team.RED

@onready var team_manager: PawnManager = get_parent()

@onready var sprite: Sprite2D = $Sprite2D

@export var speed: float = 5000.0
@export var acceleration: float = 2.0

var speed_ratio: float = 0.0

var is_moving: bool = false

var path_length: int = 0

var _path: Array[Vector2i] = []
var path: Array[Vector2i]:
	set(value):
		path_length = value.size()
		if path_length >= 2:
			_path = value
			#_path.pop_front()
			is_moving = true
		else: print("Warning: Path must contain at least 2 points")
	get: return _path


func set_active_glowing(value: bool):
	sprite.material.set_shader_parameter("enabled", value)


func _get_path_next_point() -> Vector2i:
	#print((position - Vector2(_path[0])).length())
	if (position - Vector2(_path[0])).length() <= 2.0:
		return _path.pop_front()
	return _path[0]


func _get_moving_direction() -> Vector2:
	if _path.is_empty():
		is_moving = false
		path_length = 0
		speed_ratio = 0.0
		return Vector2.ZERO
	return position.direction_to(_get_path_next_point())


## Returns 1 if traveled path less than half of entire length, -1 otherwise
func _get_traveled_path_sign():
	var sign = -1.0 if _path.size() <= 1 else 1.0
	return sign


func _physics_process(delta: float) -> void:
	if is_moving:
		speed_ratio = clampf(
			speed_ratio + _get_traveled_path_sign() * acceleration * delta, 0.0, 1.0
		)
		
		var eased_ratio = ease(speed_ratio, 3.0)
		print(eased_ratio)
		var cur_speed = lerp(0.0, speed, eased_ratio)
		
		velocity = _get_moving_direction() * cur_speed * delta
		
		move_and_slide()
