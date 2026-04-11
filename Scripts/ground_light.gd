class_name PlayerLightAttackState
extends PlayerState

func enter() -> void:
	print("Light Attack state")
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
