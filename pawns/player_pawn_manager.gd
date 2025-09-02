class_name PlayerPawnManager extends PawnManager

enum ControlType {
	CAMERA,
	PAWN
}

var control_type: ControlType = ControlType.CAMERA

@export var camera: CameraManager = null
@export var nav_manager: NavigationManager = null


func _ready() -> void:
	super._ready()
	
	active_pawn.set_active_glowing(true)
	
	EnhancedInput.left_click.connect(_on_left_click)
	EnhancedInput.left_click_with_motion.connect(_on_left_click_with_motion)
	EnhancedInput.tab.connect(_on_tab_clicked)


func _on_left_click(event: InputEventMouse):
	if active_pawn == null or control_type != ControlType.PAWN: return
	
	active_pawn.path = nav_manager.get_pawn_path(
		active_pawn.position,
		camera.get_global_mouse_position()
	)


func _on_left_click_with_motion(event: InputEventMouseMotion):
	if control_type != ControlType.CAMERA: return
	
	camera.move_camera(event.velocity)


func _on_tab_clicked(event: InputEvent):
	control_type = (control_type + 1) % ControlType.size()
