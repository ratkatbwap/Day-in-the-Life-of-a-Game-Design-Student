extends Node3D

var item_count = 0

func update_labels():
	item_count += 1
	$Label.text = "items collected: " + str(item_count)
