extends Node2D

# Loading the two textures to be used by the rabbit in the minigame
var first_texture = load("res://Assets/Sprites/House/rosy1_spr.png")
var second_texture = load("res://Assets/Sprites/House/rosy2_spr.png")

# Setting the starting position of the hand
var og_hand_position = Vector2(863.0, 63.0)

# Scaling the bunny sprites to the screen/viewport as Vector2 does not work with spritess
func _ready() -> void:
	$Button/bunny.scale = get_viewport_rect().size / $Button/bunny.texture.get_size()

func _input(event: InputEvent) -> void:
	# Rabbit's texture changes once space is pressed
	if (event.is_action_pressed("ui_accept")):
		$Button/bunny.texture = second_texture
		# Hand's position changes once space is pressed
		$hand.position = Vector2(774.0, 208.0)
		# Progress bar progresses once space is pressed
		$ProgressBar.value += 10
		# Timer is set so that the changes listed above are visible/comprehendable
		await get_tree().create_timer(0.2).timeout
		# Changes everything back
		$Button/bunny.texture = first_texture
		$hand.position = og_hand_position
		
	# Changes back to the house scene once the progress bar is full
	if $ProgressBar.value == 100:
		get_tree().change_scene_to_file("res://Scenes/house3D.tscn")
