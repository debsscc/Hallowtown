extends Node2D

onready var audio_donaMorte = $Dona_MorteSFX
var donaMorteSoundPlayed = false  # Variável para controlar se o som já foi reproduzido

#func _on_Dona_Morte_body_entered(body):
#	print("Body entered")
#	if body == $Player and not donaMorteSoundPlayed:  
#		# Verifica se o corpo que entrou na área é o jogador e se o som ainda não foi reproduzido
#
#		if audio_donaMorte and not audio_donaMorte.is_playing():  
#			# Verifica se a referência do nó AudioPlayer é válida e se o áudio não está sendo reproduzido
#			audio_donaMorte.play()
#			donaMorteSoundPlayed = true
#func _on_Dona_MorteSFX_finished():
#	audio_donaMorte.stop()

