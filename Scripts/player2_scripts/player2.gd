class_name Player2
extends CharacterBody2D

@onready var state_machine: StateMachine = $"State Machine"
@onready var animation: AnimationPlayer = $Animation
@onready var sprite: AnimatedSprite2D = $Sprite

@export var opponent: Player1

signal healthChanged

var maxHealth: int = 1000
var currentHealth: int = 1000
var sprite_flipped: bool = false

func _ready(): state_machine.init()

func _process(delta): state_machine.process_frame(delta)

func _physics_process(delta): state_machine.process_physics(delta)

func _input(event): state_machine.process_input(event)

func take_damage(damage: int) -> void:
	currentHealth  = currentHealth - damage
	healthChanged.emit()

func update_facing() -> void:
	sprite_flipped = global_position.x > opponent.global_position.x
	if sprite_flipped == true:
		sprite.offset = Vector2(-2300,-1300)
	else:
		sprite.offset = Vector2(-1300,-1300)
	sprite.flip_h = sprite_flipped
