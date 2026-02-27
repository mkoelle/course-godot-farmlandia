extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $"../../HitComponent/CollisionShape2D"

func _ready() -> void:
	collision_shape_2d.disabled = true
	collision_shape_2d.position = Vector2(0,0)

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
		collision_shape_2d.position = Vector2(-9,0)
	elif player.direction == Vector2.RIGHT:
		animated_sprite_2d.play("chop_right")
		collision_shape_2d.position = Vector2(9,0)
	elif player.direction == Vector2.UP:
		animated_sprite_2d.play("chop_up")
		collision_shape_2d.position = Vector2(0,-18)
	elif player.direction == Vector2.DOWN:
		animated_sprite_2d.play("chop_down")
		collision_shape_2d.position = Vector2(0,3)
	else:
		animated_sprite_2d.play("chop_down")
		collision_shape_2d.position = Vector2(0,3)
	collision_shape_2d.disabled = false

func _on_exit() -> void:
	animated_sprite_2d.stop()
	collision_shape_2d.disabled = true
