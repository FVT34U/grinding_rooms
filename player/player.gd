class_name Player extends CharacterBody2D

@export
var player_class: Globals.ClassNames

@export
var player_stats: StatsComponent

@export
var player_inventory: InventoryComponent

@onready var game_manager: GameManager = get_parent()

var path: Array[Vector2] = []


func _ready():
	match player_class:
		Globals.ClassNames.knight: 
			player_stats.set_character_class(Globals.class_knight)
		Globals.ClassNames.ranger:
			player_stats.set_character_class(Globals.class_ranger)
		Globals.ClassNames.mage:
			player_stats.set_character_class(Globals.class_mage)
		Globals.ClassNames.warrior:
			player_stats.set_character_class(Globals.class_warrior)
		Globals.ClassNames.priest:
			player_stats.set_character_class(Globals.class_priest)
	
	await get_tree().create_timer(1).timeout
	print(player_stats.get_stats_dict())
	
	player_inventory.remove_item(player_inventory._inventory_list[0])
	print(player_stats.get_stats_dict())


func _input(event):
	if event is InputEventMouseButton and event.pressed:
		path = game_manager.astar.get_astar_path(position, event.position)
