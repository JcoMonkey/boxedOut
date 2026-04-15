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
var standheavy_anim: String = "P2_StandHeavy"
var jumpheavy_anim: String = "P2_JumpHeavy"
var hitstun_anim: String = "Hitstun"
var defeat_anim: String = "Defeat"
var grounddash_anim: String = "P2_GroundDash"
var airdash_anim: String = "P1_AirDash"

# States (ADD AS EXTERnAL VARIABLES AND LINK IN EDITOR)
@export_group("States")
@export var idle_state: Player2State
@export var walk_state: Player2State
@export var jump_state: Player2State
@export var fall_state: Player2State
@export var standlight_state: Player2State
@export var jumplight_state: Player2State
@export var standheavy_state: Player2State
@export var jumpheavy_state: Player2State
@export var hitstun_state: Player2State
@export var defeat_state: Player2State
@export var grounddash_state: Player2State
@export var airdash_state: Player2State

# Input keys MAKE SURE THEY MATCH 
var movement_key: String = "Movement_p2"
var left_key: String = "player2_left"
var right_key: String = "player2_right"
var down_key: String = "player2_down"
var jump_key: String = "player2_up"
var light_key: String = "player2_light"
var heavy_key: String = "player2_heavy"
var dash_key: String = "player2_dash"

func process_physics(delta: float) -> State:
	player.velocity.y += gravity * delta
	player.move_and_slide()
	
	if player.is_on_floor() == true:
		player.used_airdash = false
	elif(player.velocity.y >= 0 ):
		return fall_state
	return null

func exit(new_state: State = null) -> void:
	super()
