extends Node2D



func _on_exit_casinha_body_entered(body):
		if body.has_method("player_exit_method"):
			get_tree().change_scene("res://scenes/farm.tscn")
