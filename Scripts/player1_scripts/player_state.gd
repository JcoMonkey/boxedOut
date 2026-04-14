class_name PlayerState
extends State

@onready var player: Player = get_parent().get_parent()

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
@export var idle_state: PlayerState
@export var walk_state: PlayerState
@export var jump_state: PlayerState
@export var fall_state: PlayerState
@export var standlight_state: PlayerState
@export var jumplight_state: PlayerState
@export var hitstun_state: PlayerState
@export var defeat_state: PlayerState


# Input keys MAKE SURE THEY MATCH 
var movement_key: String = "Movement"
var left_key: String = "player1_left"
var right_key: String = "player1_right"
var jump_key: String = "player1_up"
var light_key: String = "player1_light"

# Other variables
var sprite_flipped: bool = false

func determine_sprite_flipped() -> void:
	if player.position.x > player.opponent.position.x:
		#print("flipping p1 sprite")
		sprite_flipped = true
		player.sprite.offset = Vector2(-2300,-1300)

	else:
		sprite_flipped = false
		player.sprite.offset = Vector2(-1300,-1300)
	player.sprite.flip_h = sprite_flipped

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
