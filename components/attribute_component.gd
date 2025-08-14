class_name AttributeComponent extends BaseComponent


var _strength: int = 1
var strength: int:
	set(value): _strength = clampi(value, 1, 99)
	get: return _strength

var _agility: int = 1
var agility: int:
	set(value): _agility = clampi(value, 1, 99)
	get: return _agility

var _intelligence: int = 1
var intelligence: int:
	set(value): _intelligence = clampi(value, 1, 99)
	get: return _intelligence


func _init() -> void:
	component_name = "AttributeComponent"
