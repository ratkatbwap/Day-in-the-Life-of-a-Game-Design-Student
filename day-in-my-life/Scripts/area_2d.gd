extends Area2D

var first_texture = load("res://Assets/Sprites/buny_spr.png")
var second_texture = load("res://Assets/Sprites/House/tv_spr.png")

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if (event.is_action_pressed("left_click")):
		$bunny.set_texture(second_texture)
		$hand.position.Vector2(774.0, 208.0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
