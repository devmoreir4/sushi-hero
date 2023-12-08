extends InteractableObject

func _interact() -> void:
	get_tree().call_group("truck_container", "display", self, true)#chamar na interface
	pass
	
func _on_detection_area_body_entered(_body) -> void:
	if _body is Character:
		_body.current_entity = self
		if _body.can_interact:
			can_interact(true, _body)

func _on_detection_area_body_exited(_body) -> void:
	if _body is Character:
		_body.freeze(false)
		can_interact(false)
		_body.current_entity = null
