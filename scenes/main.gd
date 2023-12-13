extends Node2D

onready var backgroundSound = $som_background
onready var audio_donaMorte = $Dona_MorteSFX
var donaMorteSoundPlayed = false  # Variável para controlar se o som já foi reproduzido

var pause = pause

func _ready():
	pause = $UserInterface/pause
	pause.hide()
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
func _process(delta):
	# Verifica se o botão "esq" está pressionado
	if Input.is_action_pressed("esq"):
		# Se estiver pressionado e a sprite estiver escondida, mostre-a
		if !pause.visible:
			pause.show()
		if pause.visible:
			backgroundSound.stop()

func _on_Exit_Game_pressed():
	get_tree().change_scene("res://scenes/menu.tscn")


func _on_Resume_pressed():
	pause.hide()
	backgroundSound.play()
