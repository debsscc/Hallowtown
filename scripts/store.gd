extends Area2D

var player_in_store = 0

func _ready():
	pass # Replace with function body.

func _on_store_body_entered(body):
	var player_in_store = 1


func _on_store_body_exited(body):
	var player_in_store = 0
