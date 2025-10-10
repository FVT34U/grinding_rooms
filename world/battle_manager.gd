class_name BattleManager extends Node2D


var time: float = 0.0
var minutes: int = 0
var seconds: int = 0

## once in a second, values: 0-59
signal amount_of_seconds_changed(new_seconds: int)
## once in a minute, values: any positive int
signal amount_of_minutes_changed(new_minutes: int)
## once in a second, values: any positive float
signal time_changed(new_time: float)

@export var team_managers: Array[PawnManager] = []
var all_pawns: Array[Pawn] = []

var current_team: PawnManager = null
var current_pawn: Pawn = null


func _ready() -> void:
	if team_managers.size() < 2:
		Logger.log(
			self,
			"Add at least 2 'PawnManager' to 'team_managers' list!",
			Logger.LogType.ERROR
		)
		get_tree().quit(1)
		return
	
	for manager in team_managers:
		all_pawns.append_array(manager.controlled_pawns)
	
	for pawn in all_pawns:
		pawn.pawn_ends_its_turn.connect(_on_pawn_ends_its_turn)
	
	# Make a choise depends on speed/reaction stat of pawn
	current_pawn = all_pawns[0]
	current_team = current_pawn.team_manager


func _process(delta: float) -> void:
	time += delta
	
	_update_time(time)


func _update_time(time: float):
	var old_secs = seconds
	seconds = floori(time) - minutes * 60
	
	var old_mins = minutes
	minutes = floori(time / 60)
	
	if old_mins < minutes:
		amount_of_minutes_changed.emit(minutes)
		amount_of_seconds_changed.emit(0)
		time_changed.emit(time)
		return
	
	if old_secs < seconds:
		amount_of_seconds_changed.emit(seconds)
		time_changed.emit(time)


func _on_pawn_ends_its_turn(pawn: Pawn):
	var idx = all_pawns.find(pawn)
	
	if idx == -1:
		Logger.log(
			self,
			"Pawn '{0}' not in 'all_pawns' list!".format({0: pawn}),
			Logger.LogType.ERROR
		)
		get_tree().quit(1)
	
	current_pawn = all_pawns[(idx + 1) % all_pawns.size()]
	
	current_pawn.team_manager.take_turn(current_pawn)
