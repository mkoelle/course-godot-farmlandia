extends Sprite2D

@onready var health_component: HealthComponent = $HealthComponent
@onready var damage_component: Damage_Component = $DamageComponent

func _ready():
	damage_component.on_damage.connect(on_damage)
	health_component.destroyed.connect(fall)

func on_damage(hit_damage: int) -> void:
	health_component.apply_damage(hit_damage)

func fall() -> void:
	print("Opps I fell over")
