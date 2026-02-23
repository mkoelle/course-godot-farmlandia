extends NodeState

@export var player: CharacterBody2D
@export var animated_sprite_2d: AnimatedSprite2D
@export var speed: int = 50

var direction: Vector2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_process(delta: float) -> void:
	pass

func _on_physics_process(delta: float) -> void:
	direction = GameInputEvents.movement_input()
	
	if direction == Vector2.LEFT:
		animated_sprite_2d.play("walk_left")
	elif direction == Vector2.RIGHT:
		animated_sprite_2d.play("walk_right")
	elif direction == Vector2.UP:
		animated_sprite_2d.play("walk_up")
	elif direction == Vector2.DOWN:
		animated_sprite_2d.play("walk_down")
		
	player.velocity = direction * speed
	player.move_and_slide()
	

func _on_next_transition() -> void:
	if(!GameInputEvents.is_movement_input()):
		transition.emit("Idle")

func _on_enter() -> void:
	pass

func _on_exit() -> void:
	pass
