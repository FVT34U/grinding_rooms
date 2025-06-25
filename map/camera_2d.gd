extends Camera2D


@export var zoom_step := 0.1
@export var min_zoom := 0.5
@export var max_zoom := 2.0


func _ready() -> void:
	await get_tree().create_timer(0.1).timeout
	position = get_parent().get_room_center_coords()


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("scroll_up"):
		var new_x = zoom.x + zoom_step if zoom.x + zoom_step <= max_zoom else zoom.x
		var new_y = zoom.y + zoom_step if zoom.y + zoom_step <= max_zoom else zoom.y
		zoom = Vector2(new_x, new_y)
	if Input.is_action_just_pressed("scroll_down"):
		var new_x = zoom.x - zoom_step if zoom.x - zoom_step >= min_zoom else zoom.x
		var new_y = zoom.y - zoom_step if zoom.y - zoom_step >= min_zoom else zoom.y
		zoom = Vector2(new_x, new_y)
	if Input.is_action_just_pressed("middle_mouse"):
		zoom = Vector2.ONE
