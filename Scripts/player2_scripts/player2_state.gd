class_name Player2State
extends State

@onready var player: Player2 = get_parent().get_parent()

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity",980)

# Animation names
var idle_anim: String = "Idle"
var walk_anim: String = "Walk"
var jump_anim: String = "Jump"
var fall_anim: String = "Fall"
var standlight_anim: String = "StandLight"
var jumplight_anim: String = "JumpLight"
var hitstun_anim: String = "Hitstun"
var defeat_anim: String = "Defeat"


# States (ADD AS EXTERnAL VARIABLES AND LINK IN EDITOR)
@export_group("States")
@export var idle_state: Player2State
@export var walk_state: Player2State
@export var jump_state: Player2State
@export var fall_state: Player2State
@export var standlight_state: Player2State
@export var jumplight_state: Player2State
@export var hitstun_state: Player2State
@export var defeat_state: Player2State


# Input keys MAKE SURE THEY MATCH 
var movement_key: String = "Movement_p2"
var left_key: String = "player2_left"
var right_key: String = "player2_right"
var jump_key: String = "player2_up"
var light_key: String = "player2_light"

# Other variables
var sprite_flipped: bool = false

# need to track later player facing direction relative to opponent

# TODO later for crossing up
# use player.sprite.flip_h = sprite_flipped
func determine_sprite_flipped() -> void:
	pass

#ts kinda broken
func process_physics(delta: float) -> State:
	player.velocity.y += gravity * delta
	player.move_and_slide()
	#print("player.is_on_floor() =", player.is_on_floor())
	if(player.velocity.y >= 0 and not player.is_on_floor()):
		return fall_state
	return null

func exit(new_state: State = null) -> void:
	super()
	#new_state.sprite_flipped = sprite_flipped
