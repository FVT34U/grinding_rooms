class_name RectRoom extends BaseRoom


func generate() -> bool:
	var rng = RandomNumberGenerator.new()
	if Globals.rng_seed != "default":
		rng.seed = hash(Globals.rng_seed)
	
	var r_x = rng.randi_range(3, 6)
	var r_y = rng.randi_range(3, 6)
	#print("r_x: {a}, r_y: {b}".format({"a": r_x, "b": r_y}))
	
	var s_x: int = self.width / r_x
	var s_y: int = self.height / r_y
	#print("s_x: {a}, s_y: {b}".format({"a": s_x, "b": s_y}))
	
	var e_x: int = self.width - self.width / r_x
	var e_y: int = self.height - self.height / r_y
	#print("e_x: {a}, e_y: {b}".format({"a": e_x, "b": e_y}))
	
	for j in range(s_y, e_y):
		for i in range(s_x, e_x):
			set_cell(Vector2i(i, j), 1, Vector2i(0, 0), 0)
	
	return true
