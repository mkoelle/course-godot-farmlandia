extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_process(_delta: float) -> void:
	pass

func _on_physics_process(_delta: float) -> void:
	pass

func _on_next_transition() -> void:
	if(!animated_sprite_2d.is_playing()):
		transition.emit("idle")

func _on_enter() -> void:

	if player.direction == Vector2.LEFT:
		animated_sprite_2d.play("chop_left")
	elif player.direction == Vector2.RIGHT:
		animated_sprite_2d.play("chop_right")
	elif player.direction == Vector2.UP:
		animated_sprite_2d.play("chop_up")
	elif player.direction == Vector2.DOWN:
		animated_sprite_2d.play("chop_down")
	else:
		animated_sprite_2d.play("chop_down")

func _on_exit() -> void:
	animated_sprite_2d.stop()
