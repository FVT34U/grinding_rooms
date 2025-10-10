class_name AIPawnManager extends PawnManager

#TODO: do some intelligent moves)
func do_move():
	active_pawn.path = nav_manager.get_pawn_path(
		active_pawn.position,
		Vector2i(Globals.rng.randi_range(0, 624), Globals.rng.randi_range(0, 336))
	)


##TODO: visualize some pawn information
func _on_input_on_pawn(
	viewport: Node, 
	event: InputEvent, 
	shape_idx: int,
	pawn: Pawn
):
	if event is InputEventMouseButton and Input.is_action_just_pressed("left_click"):
		print(pawn.name)


func _update_active_pawn(pawn: Pawn):
	active_pawn = pawn
	do_move()
