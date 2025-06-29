extends Node


var sprites_pixel_size := 16

var empty_floor_texture = load("res://assets/floor/BaseEmpty_01.png")
var base_floor_texture = load("res://assets/floor/BaseFloor_01.png")

## use "default" for full random, use anything else for reproducable random
var rng_seed = "default"

enum ClassNames {
	knight,
	ranger,
	mage,
	warrior,
	priest,
}

enum StatNames {
	strength,
	agility,
	intelligence,
	faith,
}

func _ready() -> void:
	print(StatNames.keys()[StatNames.strength])
