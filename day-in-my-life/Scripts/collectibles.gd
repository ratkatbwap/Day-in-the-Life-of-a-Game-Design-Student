extends Area3D

@export var house: Node3D

# If the player enters the body, the object is destroyed
func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		house.update_labels()
		queue_free()
