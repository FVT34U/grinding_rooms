class_name PawnManager extends Node


enum TeamColor {
	BLUE, 
	RED,
	GREEN,
	WHITE,
	BLACK,
}

## BLUE - only for player
## RED - basic enemy team
@export var manager_team_color = TeamColor.RED

@onready var controlled_pawns: Array[Pawn] = []
var active_pawn: Pawn = null

signal pawn_team_changed(pawn: Pawn)
signal team_ends_their_turn(team: PawnManager)


func change_pawn_team(pawn: Pawn, new_manager: PawnManager) -> bool:
	pawn.reparent(new_manager)
	pawn_team_changed.emit(pawn, new_manager)
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
	printerr("Not implemented!")
