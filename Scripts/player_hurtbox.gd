class_name PlayerHurtBox
extends Hurtbox

@onready var hitstun_state: PlayerHitstunState = $"../State Machine/Hitstun"
@onready var state_machine: StateMachine = $"../State Machine"

var hitting_area: Node2D

func on_area_entered(hitbox: Hitbox) -> void:
	print("Damage dealt player")
	if hitbox == null: return
	super(hitbox)
	hitting_area = hitbox.owner
	state_machine.change_state(hitstun_state)
