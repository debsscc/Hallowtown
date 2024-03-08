extends Node2D


func _on_exit_casinha_body_entered(body):
		if body.has_method("player_exit_method"):
			get_tree().change_scene("res://scenes/farm.tscn")

func _on_torneira_body_entered(body):
	if body.has_method("player_exit_method"):
		var dialogo_torneira = Dialogic.start('torneira')
		add_child(dialogo_torneira)
	

func _on_escadas_body_entered(body):
	if body.has_method("player_exit_method"):
		var dialogo_escadas = Dialogic.start('escadas')
		add_child(dialogo_escadas)


func _on_cama_body_entered(body):
	if body.has_method("player_exit_method"):
		var dialogo_cama = Dialogic.start('cama')
		add_child(dialogo_cama)
