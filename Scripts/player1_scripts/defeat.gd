class_name PlayerDefeatState
extends PlayerState

func enter() -> void:
	print("Defeat state")
	player.animation.play(defeat_anim)
	
func exit(new_state: State = null) -> void:
	super(new_state)
	pass

func process_input(event: InputEvent) -> State:
	super(event)
	return null

func process_physics(delta: float) -> State:
	super.process_physics(delta)
	return null
	
func process_frame(delta: float) -> State:
	super(delta)
	return null
