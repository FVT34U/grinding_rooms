class_name InventoryComponent extends BaseComponent


@export
var debug_items_list: Array[Item] = []

var _inventory_list: Array[Item] = []

@export
var capacity: int = 10:
	get: return capacity


func add_item(new_item: Item) -> bool:
	if self._inventory_list.size() >= capacity:
		return false
	
	self._inventory_list.append(new_item)
	return true


func remove_item(rm_item: Item) -> bool:
	if not self._inventory_list.has(rm_item): return false
	
	self._inventory_list.erase(rm_item)
	return true


func _ready() -> void:
	for item in debug_items_list:
		if not add_item(item): break
