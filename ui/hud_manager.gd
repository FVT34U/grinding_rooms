class_name HUDManager extends CanvasLayer


func _ready() -> void:
	%EnemyPortraitContainer.child_entered_tree.connect(_on_child_entered_tree)
	
	for child: Button in %EnemyPortraitContainer.get_children():
		child.disabled = true


func _on_child_entered_tree(node: Node):
	if node is Button:
		node.disabled = true
