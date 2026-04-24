class_name Hitbox
extends Area2D

@export var damage: int = 100
@export var knockback: float = 100.0
@export var hitstun: int = 1

func _ready():
	
	pass
	#collision_layer = 2
	#collision_mask = 0
