extends Area2D

func _ready():
	$AnimatedSprite2D.play()
func _process(delta):
	pass

func _on_body_entered(body: Rubios):
	body.keys += 1
	queue_free()
