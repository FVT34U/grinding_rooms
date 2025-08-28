extends Node

signal left_click(event: InputEventMouse)
signal right_click(event: InputEventMouse)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouse and event.is_action_pressed("left_click"):
		left_click.emit(event)
	if event is InputEventMouse and event.is_action_pressed("right_click"):
		right_click.emit(event)
