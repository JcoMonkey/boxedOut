class_name PlayerLightAttackState
extends PlayerState

@onready var hitbox_area: Hitbox = $"5L_HitboxArea"

func enter() -> void:
	print("Light Attack state")
	
	if sprite_flipped: hitbox_area.scale.x = -1
	else: hitbox_area.scale.x = 1
	
	player.animation.play(standlight_anim)
	
func exit(new_state: State = null) -> void:
	super()
	pass

func process_input(event: InputEvent) -> State:
	super(event)

	return null

func process_physics(delta: float) -> State:
	super.process_physics(delta)
	return null
