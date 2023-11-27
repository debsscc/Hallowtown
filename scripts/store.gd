extends Area2D

func _ready():
	pass # Replace with function body.

func _on_store_body_entered(body):
	Global.player_in_store = 1


func _on_store_body_exited(body):
	Global.player_in_store = 0
