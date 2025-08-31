class_name CameraManager extends Camera2D


func _ready() -> void:
	EnhancedInput.left_click_with_motion.connect(_on_left_click_with_motion)


func _physics_process(delta: float) -> void:
	pass


func _on_left_click_with_motion(event: InputEventMouseMotion):
	position += (-event.velocity * get_process_delta_time())
