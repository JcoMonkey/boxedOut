extends ProgressBar

@onready var player : Player1 = get_node("../../../Player1")

func _ready():
	player.healthChanged.connect(update)
	update()

func update():
	value = player.currentHealth * 100 / player.maxHealth
