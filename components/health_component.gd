class_name HealthComponent extends BaseComponent


var _attribute_comp: AttributeComponent

var _hp: int = 0
var hp: int:
	set(new_hp): _hp = clampi(new_hp, 0, max_hp)
	get: return _hp

var _max_hp: int = 0
var max_hp: int:
	get: return _attribute_comp.strength * 10


func _init(attribute_comp: AttributeComponent) -> void:
	if attribute_comp == null: return
	_attribute_comp = attribute_comp
	
	component_name = "HealthComponent"
	
	hp = max_hp
