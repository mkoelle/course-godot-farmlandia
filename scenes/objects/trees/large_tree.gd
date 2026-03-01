extends Sprite2D

@onready var damage_component: Damage_Component = $"../DamageComponent"
@onready var health_component: HealthComponent = $"../HealthComponent"

var log_scene = preload("res://scenes/objects/trees/log.tscn")

func _ready():
	damage_component.on_damage.connect(on_damage)
	health_component.destroyed.connect(fall)

func on_damage(hit_damage: int) -> void:
	health_component.apply_damage(hit_damage)
	(material as ShaderMaterial).set_shader_parameter("shake_intensity",1.0)
	await get_tree().create_timer(1.0).timeout
	(material as ShaderMaterial).set_shader_parameter("shake_intensity",0.0)

func fall() -> void:
	call_deferred("add_log")
	print("Opps I fell over")
	queue_free()

func add_log()-> void:
	var loggy = log_scene.instantiate() as Node2D
	loggy.global_position = get_parent().global_position
	get_parent().get_parent().add_child(loggy)
