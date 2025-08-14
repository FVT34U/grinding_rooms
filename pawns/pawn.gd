class_name Pawn extends CharacterBody2D


@export var pawn_team = PawnManager.Team.ENEMY

@onready var team_manager: PawnManager = get_parent()
