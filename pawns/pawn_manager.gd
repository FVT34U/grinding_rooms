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

@export var nav_manager: NavigationManager = null

@onready var controlled_pawns: Array[Pawn] = []
var active_pawn: Pawn = null

signal pawn_team_changed(pawn: Pawn)


func _ready() -> void:
	for child: Pawn in get_children():
		controlled_pawns.append(child)
		child.input_event.connect(_on_input_on_pawn.bind(child))
	
	if not controlled_pawns.is_empty():
		active_pawn = controlled_pawns[0]


func change_pawn_team(pawn: Pawn, new_manager: PawnManager) -> bool:
	pawn.reparent(new_manager)
	pawn_team_changed.emit(pawn, new_manager)
	return true


func take_turn(pawn: Pawn):
	if pawn not in controlled_pawns:
		Logger.log(
			self,
			"Pawn '{0}' not in 'controlled_pawns' list!".format({0: pawn}),
			Logger.LogType.ERROR
		)
		return
	
	_update_active_pawn(pawn)


func _update_active_pawn(pawn: Pawn):
	Logger.log(
		self,
		"Method '_on_update_active_pawn' not implemented!",
		Logger.LogType.ERROR
	)
	return


##TODO: visualize some pawn information
func _on_input_on_pawn(
	viewport: Node, 
	event: InputEvent, 
	shape_idx: int,
	pawn: Pawn
):
	Logger.log(
		self,
		"Method '_on_input_on_pawn' not implemented!",
		Logger.LogType.ERROR
	)
