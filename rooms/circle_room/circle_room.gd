class_name CircleRoom extends BaseRoom


func generate() -> bool:
	var rng = RandomNumberGenerator.new()
	if GlobalParameters.rng_seed != "default":
		rng.seed = hash(GlobalParameters.rng_seed)
	
	var c_x = self.width / 2
	var c_y = self.height / 2
	
	var max_r = min(c_x, c_y)
	var min_r = int(max_r * 0.25)
	
	var r = rng.randi_range(min_r, max_r)
	
	for j in range(0, self.height):
		for i in range(0, self.width):
			if (i - c_x) * (i - c_x) + (j - c_y) * (j - c_y) <= r * r:
				set_cell(Vector2i(i, j), 1, Vector2i(0, 0), 0)
	
	return true
