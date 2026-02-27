class_name Damage_Component
extends Area2D

@export var tool : Data_Types.Tools = Data_Types.Tools.None

signal on_damage

func _on_area_entered(area: Area2D) -> void:
	on_damage.emit()
