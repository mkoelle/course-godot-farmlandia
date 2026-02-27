class_name HealthComponent
extends Node2D

@export var health : int = 1

signal destroyed

func apply_damage(damage: int) -> void :
	health = health - damage
	if health < 0:
		destroyed.emit()
