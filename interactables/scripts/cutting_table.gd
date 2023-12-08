extends InteractableObject

var _item_ref: MeshInstance3D = null

@export var _ingredients: Node3D = null

@export_category("Variables")
@export var _rotation: float = PI/2
@export var _position: Vector3 = Vector3(-11.5, 0.091, 3.5)

func _interact() -> void:
	_character_ref.change_position(_position, _rotation)
	get_tree().call_group("cutting_container", "display", self, true)#chamar interface
	
func chop(_items: Array) -> void:
	_item_ref = _ingredients.get_node(_items[randi() % _items.size()].to_pascal_case())
	_item_ref.show()
	
	await get_tree().create_timer(5.834).timeout
	_item_ref.hide()
