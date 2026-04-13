extends ProgressBar

@export var playerInfo : PlayerState

func _ready():
	#playerInfo.healthChanged.connect(update)
	update()

func update():
	pass
	#value = playerInfo. currentHealth * 100 / playerInfo.maxHealth
