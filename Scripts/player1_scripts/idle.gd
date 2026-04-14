class_name PlayerIdleState
extends PlayerState

func enter() -> void:
	print("Idle state")
	player.animation.play(idle_anim)
	
func exit(new_state: State = null) -> void:
	super(new_state)
	pass

func process_input(event: InputEvent) -> State:
	super(event)
	if event.is_action_pressed(movement_key): 
		return walk_state
	elif event.is_action_pressed(jump_key):
		return jump_state
	elif event.is_action_pressed(light_key):
		return standlight_state
	elif event.is_action_pressed(dash_key):
		return grounddash_state
	return null

func process_physics(delta: float) -> State:
	player.update_facing()
	return super.process_physics(delta)
	
