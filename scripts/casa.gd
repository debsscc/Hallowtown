extends Node2D

onready var Player = $Player

func _ready():
	if Global.posicao_do_jogador == 1: #main para fazenda
		Player.position = Vector2(0, 340)
	elif Global.posicao_do_jogador == 2: #fazenda para main
		Player.position = Vector2(0, -340)
	elif Global.posicao_do_jogador == 3: #fazenda para casa
		Player.position = Vector2(0, 100)
	elif Global.posicao_do_jogador == 4: #casa para fazenda
		Player.position = Vector2(0, -140)

func _on_exit_casinha_body_entered(body):
	Global.posicao_do_jogador = 4
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
