extends Sprite2D

@onready var health_component: HealthComponent = $HealthComponent
@onready var damage_component: Damage_Component = $DamageComponent

var log_scene = preload("res://scenes/objects/trees/log.tscn")

func _ready():
	damage_component.on_damage.connect(on_damage)
	health_component.destroyed.connect(fall)

func on_damage(hit_damage: int) -> void:
	health_component.apply_damage(hit_damage)

func fall() -> void:
	call_deferred("add_log")
	print("Opps I fell over")
	queue_free()

func add_log()-> void:
	var log = log_scene.instantiate() as Node2D
	log.global_position = global_position
	get_parent().add_child(log)
