class_name PlayerHitstunState
extends PlayerState

@onready var hurtbox: Player1HurtBox = $"../../PlayerHurtbox"

var hitstun_complete

func enter() -> void:
	player.take_damage(100)
	print("Player health = ",player.currentHealth)
	hitstun_complete = false
	print("Hitstun state")
	player.animation.play(hitstun_anim)
	player.animation.animation_finished.connect(func(_anim): hitstun_complete = true)

func exit(new_state: State = null) -> void:
	super(new_state)
	player.velocity.x = 0

func process_input(event: InputEvent) -> State:
	super(event)
	#fix this later so you can jump when hitstun ends
	if event.is_action_pressed(jump_key) && hitstun_complete:
		return jump_state
	return null

func process_physics(delta: float) -> State:
	knockback()
	#return super(delta)
	player.velocity.y += gravity * delta
	player.move_and_slide()
	return null
	
func process_frame(delta: float) -> State:
	super(delta)
	if hitstun_complete:
		print("hitstun complete")
		if player.currentHealth <= 0:
			return defeat_state
		elif(not player.is_on_floor()):
			return fall_state
		elif get_move_dir() != 0.0:
			return walk_state
		else: 
			return idle_state
	return null

func knockback() -> void:
	var x_force := 114.0
	#var y_force := -10.0

	#check which direction to send
	if player.global_position.x > player.opponent.global_position.x:
		player.velocity.x = x_force
	else:
		player.velocity.x = -x_force


func get_move_dir() -> float:
	print("Input axis = ", Input.get_axis(left_key, right_key))
	return Input.get_axis(left_key, right_key)
