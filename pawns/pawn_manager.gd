class_name PawnManager extends Node


enum Team {
	ALLY,
	ENEMY
}

@export var manager_team = Team.ENEMY

@onready var controlled_pawns: Array[Pawn] = []

signal pawn_team_changed(pawn: Pawn, new_team: PawnManager.Team)


func change_pawn_team(manager: PawnManager, pawn: Pawn) -> bool:
	pawn.reparent(manager)
	pawn_team_changed.emit(pawn, manager.manager_team)
	return true


func _ready() -> void:
	for child: Pawn in get_children():
		controlled_pawns.append(child)
