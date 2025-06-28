class_name InventoryComponent extends BaseComponent


var _inventory_list: Array[Item] = []
@export
var items_list: Array[Item] = []

@export
var capacity: int = 10:
	get: return capacity


func add_item(new_item: Item) -> bool:
	if self._inventory_list.size() >= capacity:
		return false
	
	self._inventory_list.append(new_item)
	
	return true


func remove_item() -> bool:
	return false


func _ready() -> void:
	for item in self.items_list:
		self._inventory_list.append(item)
		
