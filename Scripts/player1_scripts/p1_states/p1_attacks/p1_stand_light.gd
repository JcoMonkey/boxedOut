class_name PlayerStandLightState
extends PlayerState

var attack_complete
@onready var hitbox: CollisionShape2D = $"5L_HitboxArea/5L_hitbox"

func enter() -> void:
	attack_complete = false
	print("\nP1 Light Attack state")
	
	if player.sprite_flipped == true: 
		hitbox.position.x *= -1
		print("hitbox flipped")
		
	player.animation.play(standlight_anim)
	player.animation.animation_finished.connect(func(_anim): attack_complete = true)
	
func exit(new_state: State = null) -> void:
	hitbox.set_deferred("disabled", true)
	hitbox.position.x = abs(hitbox.position.x)
	attack_complete = true
	super(new_state)
	pass

func process_input(event: InputEvent) -> State:
	super(event)
	if event.is_action_pressed(heavy_key):
		return standheavy_state
	return null

func process_physics(delta: float) -> State:
	super.process_physics(delta)
	return null
	
func process_frame(delta: float) -> State:
	super(delta)
	if attack_complete: 
		print("attack complete")
		if get_move_dir() != 0.0:
			return walk_state
		else: 
			return idle_state
	return null

func get_move_dir() -> float:
	print("Input axis = ", Input.get_axis(left_key, right_key))
	return Input.get_axis(left_key, right_key)
