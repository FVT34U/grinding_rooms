class_name HUDManager extends CanvasLayer

var enemy_portraits = []
var ally_portraits = []

var active_portrait: Button = null

@onready var world: BattleManager = get_parent()

signal active_pawn_changed(idx: int)


func _ready() -> void:
	%EnemyPortraitContainer.child_entered_tree.connect(
		_on_enemy_portraits_child_entered_tree
	)
	%AllyPortraitContainer.child_entered_tree.connect(
		_on_ally_portraits_child_entered_tree
	)
	
	world.amount_of_seconds_changed.connect(_on_amount_of_seconds_changed)
	world.amount_of_minutes_changed.connect(_on_amount_of_minutes_changed)
	
	enemy_portraits = %EnemyPortraitContainer.get_children()
	ally_portraits = %AllyPortraitContainer.get_children()
	
	for child: Button in enemy_portraits:
		child.disabled = true
	
	var idx = 0
	for child: Button in ally_portraits:
		child.pressed.connect(_on_portrait_pressed.bind())
	
	active_portrait = ally_portraits[0]
	active_portrait.grab_focus()


func _on_enemy_portraits_child_entered_tree(node: Node):
	if node is not Button:
		%EnemyPortraitContainer.remove_child(node)
		return
	
	node.disabled = true
	enemy_portraits.append(node)


func _on_ally_portraits_child_entered_tree(node: Node):
	if node is not Button:
		%AllyPortraitContainer.remove_child(node)
		return
	
	ally_portraits.append(node)


func _on_portrait_pressed():
	pass


func _on_amount_of_seconds_changed(value):
	%LabelSeconds.text = "0" + str(value) if value < 10 else str(value)


func _on_amount_of_minutes_changed(value):
	%LabelMinutes.text = "0" + str(value) if value < 10 else str(value)


func get_focused_pawn_portrait_idx() -> int:
	var idx = 0
	for portrait: Button in ally_portraits:
		if portrait.has_focus(): return idx
		idx += 1
	
	return -1
