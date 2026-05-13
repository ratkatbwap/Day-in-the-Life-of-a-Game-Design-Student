extends Node2D

var first_texture = load("res://Assets/Sprites/House/rosy1_spr.png")
var second_texture = load("res://Assets/Sprites/House/rosy2_spr.png")


var og_hand_position = Vector2(863.0, 63.0)
var changed = false

func _ready() -> void:
	$Button/bunny.scale = get_viewport_rect().size / $Button/bunny.texture.get_size()

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("ui_accept")):
		$Button/bunny.texture = second_texture
		$hand.position = Vector2(774.0, 208.0)
		$ProgressBar.value += 10
		await get_tree().create_timer(0.2).timeout
		$Button/bunny.texture = first_texture
		$hand.position = og_hand_position
		
	if $ProgressBar.value == 100:
		get_tree().change_scene_to_file("res://Scenes/house3D.tscn")
