class_name Hurtbox
extends Area2D

func _ready():
	collision_layer = 0
	collision_mask = 2
	self.area_entered.connect(on_area_entered)

func on_area_entered(hitbox: Hitbox) -> void:
	print("Damage")
	if hitbox == null: return

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
