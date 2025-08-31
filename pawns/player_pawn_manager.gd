class_name PlayerPawnManager extends PawnManager


func _ready() -> void:
	super._ready()
	
	active_pawn.set_active_glowing(true)
	
	# temp
	active_pawn = null
	
	EnhancedInput.left_click.connect(_on_left_click)


func _on_left_click(event: InputEventMouse):
	if active_pawn == null: return
	
	active_pawn.path = %NavigationManager.get_pawn_path(
		active_pawn.position, event.position
	)
