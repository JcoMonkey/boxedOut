class_name PlayerHitstunState
extends PlayerState

@onready var hurtbox: PlayerHurtBox = $"../../PlayerHurtbox"

var hitstun_complete

func enter() -> void:
	hitstun_complete = false
	print("Hitstun state")
	player.animation.play(hitstun_anim)
	player.animation.animation_finished.connect(func(_anim): hitstun_complete = true)

func exit(new_state: State = null) -> void:
	super(new_state)
	player.velocity.x = 0

func process_input(event: InputEvent) -> State:
	knockback()
	super(event)
	return null

func process_physics(delta: float) -> State:
	return super(delta)
	
func process_frame(delta: float) -> State:
	super(delta)
	if hitstun_complete: 
		print("hitstun complete")
		if(not player.is_on_floor()):
			return fall_state
		elif get_move_dir() != 0.0:
			return walk_state
		else: 
			return idle_state
	return null

func knockback() -> void:
	var push_dir: Vector2 = hurtbox.hitting_area.global_position - player.global_position
	player.velocity.x += push_dir.x

func get_move_dir() -> float:
	print("Input axis = ", Input.get_axis(left_key, right_key))
	return Input.get_axis(left_key, right_key)
