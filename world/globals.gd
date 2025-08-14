extends Node

var rng = RandomNumberGenerator.new()
var rng_seed = "default"

func _ready() -> void:
	if rng_seed != "default":
		rng.seed = rng_seed
	else:
		rng.randomize()
