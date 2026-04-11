class_name State
extends Node2D

func enter() -> void:
	pass

# Called when the node enters the scene tree for the first time.
func exit(new_state: State = null) -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func process_frame(delta: float) -> State:
	return null
	
func process_input(event: InputEvent) -> State:
	return null
	
func process_physics(delta: float) -> State:
	return null
