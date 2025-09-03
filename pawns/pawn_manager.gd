class_name PawnManager extends Node


enum Team {
	BLUE, 
	RED,
	GREEN,
	WHITE,
	BLACK,
}

## BLUE - only for player
## RED - basic enemy team
@export var manager_team = Team.RED

@onready var controlled_pawns: Array[Pawn] = []
var active_pawn: Pawn = null

signal pawn_team_changed(pawn: Pawn, new_team: PawnManager.Team)


func change_pawn_team(manager: PawnManager, pawn: Pawn) -> bool:
	pawn.reparent(manager)
	pawn_team_changed.emit(pawn, manager.manager_team)
	return true


func _ready() -> void:
	for child: Pawn in get_children():
		controlled_pawns.append(child)
		child.input_event.connect(_on_input_on_pawn.bind(child))
	
	if not controlled_pawns.is_empty():
		active_pawn = controlled_pawns[0]


func _on_input_on_pawn( 
	viewport: Node, 
	event: InputEvent, 
	shape_idx: int,
	pawn: Pawn
):
	if event is InputEventMouseButton and Input.is_action_just_pressed("left_click"):
		print(pawn.name)
		active_pawn = pawn
