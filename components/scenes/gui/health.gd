extends CanvasLayer

@onready var health_bar = $Control/PanelContainer/MarginContainer/GridContainer/Container/TextureProgressBar
@onready var mana_bar = $Control/PanelContainer/MarginContainer/GridContainer/Container3/TextureProgressBar

var health: float
var mana: float

func _ready():
	health = 100
	mana = 100
	update_health()
	update_mana()
func _process(delta):
	pass

func update_health():
	health_bar.value = health
func update_mana():
	mana_bar.value = mana
