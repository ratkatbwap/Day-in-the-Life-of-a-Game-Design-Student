extends Node3D

var item_count = 0

# Adds one to the counter ui each time an object is collected
func update_labels():
	item_count += 1
	$Label.text = "items collected: " + str(item_count)
