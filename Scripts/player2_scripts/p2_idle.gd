class_name Player2IdleState
extends Player2State

func enter() -> void:
	print("p2 Idle state")
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
	return null

func process_physics(delta: float) -> State:
	determine_sprite_flipped()
	return super.process_physics(delta)
	
