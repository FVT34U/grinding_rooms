extends Node

signal left_click(event: InputEventMouse)
signal right_click(event: InputEventMouse)
signal escape(event: InputEvent)

signal left_click_with_motion(event: InputEventMouseMotion)

var hold_lmb = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		hold_lmb = true
	if event.is_action_released("left_click"):
		hold_lmb = false
	if event is InputEventMouseMotion and hold_lmb:
		left_click_with_motion.emit(event)
	
	if event is InputEventMouse and event.is_action_pressed("left_click"):
		left_click.emit(event)
	if event is InputEventMouse and event.is_action_pressed("right_click"):
		right_click.emit(event)
	
	if event is InputEvent and event.is_action_pressed("escape"):
		get_tree().quit(0)
