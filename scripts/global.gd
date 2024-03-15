extends Node

var plantselected = 1 #1 = guarana | 2 = abobora

#verifica o numero de frutos
var numofguaranas = 0
var numofaboboras = 0

#moedas do jogador
var coins = 0

var posicao_do_jogador = 0

#func ready():
#	var pposition = Vector2(0,5)
#	if posicao_do_jogador == 1: #main para fazenda
#		pposition = Vector2(0, 340)
#	elif posicao_do_jogador == 2: #fazenda para main
#		pposition = Vector2(0, -340)
#	elif posicao_do_jogador == 3: #fazenda para casa
#		pposition = Vector2(0, 100)
#	elif posicao_do_jogador == 4: #casa para fazenda
#		pposition = Vector2(0, -140)
