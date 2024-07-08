extends Node2D

@onready var focus_scene = $FocusScene

func _on_hurt_box_body_entered(body):
	focus_scene.visible = true

func _on_hurt_box_body_exited(body):
	focus_scene.visible = false
