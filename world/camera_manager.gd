class_name CameraManager
extends Camera2D

var velocity: Vector2 = Vector2.ZERO
@export var friction: float = 5.0       # чем больше, тем быстрее затухает
@export var sensitivity: float = 1.0    # чувствительность к движению мыши


func _physics_process(delta: float) -> void:
	position += velocity * delta
	velocity = velocity.lerp(Vector2.ZERO, 1.0 - exp(-friction * delta))

func move_camera(event_velocity: Vector2) -> void:
	velocity += -event_velocity * sensitivity * get_physics_process_delta_time()
