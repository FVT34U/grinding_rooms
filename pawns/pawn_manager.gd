class_name PawnManager extends Node


enum Team {
	ALLY,
	ENEMY
}

@export var manager_team = Team.ENEMY

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
	
	if not controlled_pawns.is_empty():
		active_pawn = controlled_pawns[0]
	
	EnhancedInput.left_click.connect(_on_left_click)


func _on_left_click(event: InputEventMouse):
	if manager_team != Team.ALLY: return
	active_pawn.path = %NavigationManager.get_pawn_path(active_pawn.position, event.position)
