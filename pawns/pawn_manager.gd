class_name PawnManager extends Node


enum Team {
	ALLY,
	ENEMY
}

@export var manager_team = Team.ENEMY

@onready var controlled_pawns: Array[Node] = get_children()

signal pawns_team_changed(pawn: Pawn, new_team: PawnManager.Team) # TODO: more teams mb


func change_pawn_team(manager: PawnManager, pawn: Pawn) -> bool:
	pawn.reparent(manager)
	pawns_team_changed.emit(pawn, manager.manager_team)
	return true
