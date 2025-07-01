extends Node


var sprites_pixel_size := 16

var empty_floor_texture = preload("res://assets/floor/BaseEmpty_01.png")
var base_floor_texture = preload("res://assets/floor/BaseFloor_01.png")

## use "default" for full random, use anything else for reproducable random
var rng_seed = "default"


func get_rng() -> RandomNumberGenerator:
	var rng = RandomNumberGenerator.new()
	if Globals.rng_seed != "default":
		rng.seed = Globals.rng_seed
	return rng


enum ClassNames {
	knight,
	ranger,
	mage,
	warrior,
	priest,
}

var class_knight = preload("res://resources/classes/class_knight.tres")
var class_ranger = preload("res://resources/classes/class_ranger.tres")
var class_mage = preload("res://resources/classes/class_mage.tres")
var class_warrior = preload("res://resources/classes/class_warrior.tres")
var class_priest = preload("res://resources/classes/class_priest.tres")


enum StatNames {
	strength,
	agility,
	intelligence,
	faith,
	luck,
	hp,
	mp,
	melee_damage,
	range_damage,
	magic_damage,
	physical_defence,
	magical_defence,
	evasion_rate,
	parry_rate,
	speed,
}


func stat_str_name(stat: StatNames) -> String:
	return StatNames.keys()[stat]
