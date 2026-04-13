extends ProgressBar

@onready var player : Player2 = get_node("../../Player2")

func _ready():
	player.healthChanged.connect(update)
	update()

func update():
	value = player.currentHealth * 100 / player.maxHealth
