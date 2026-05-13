extends CharacterBody2D

const SPEED = 150.0
var direction = Vector2.ZERO

@onready var sprite_play = $AnimatedSprite2D
var animation_prefix = ""
var last_face_dir = "fwd"

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_x := Input.get_axis("ui_left", "ui_right")
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var direction_y := Input.get_axis("ui_up", "ui_down")
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
		
	# Movement Animation
	if direction.x != 0:
		var face_dir = "left" if (direction.x < 0) else "right"
		sprite_play.play("walk_" + face_dir)
		last_face_dir = face_dir
		
	elif direction.y != 0:
		var face_dir = "back" if (direction.y < 0) else "fwd"
		sprite_play.play("walk_" + face_dir)
		last_face_dir = face_dir
		
	else:
		sprite_play.play("idle_" + last_face_dir)

	move_and_slide()
