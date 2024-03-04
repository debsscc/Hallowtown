extends Node2D

onready var backgroundSound = $som_background
onready var audio_donaMorte = $Dona_MorteSFX
onready var regando = $Ysort/Entidades/Player/AnimatedSprite
var donaMorteSoundPlayed = false  # Variável para controlar se o som já foi reproduzido

var pause = pause
var isPaused = false #Variavel que rastreia se o jogo ta pausado


func _ready():
	pause = $UserInterface/pause
	pause.hide()

	if Input.is_action_just_pressed("regando"):
		$AnimatedSprite.play("rega_down")


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
	# Verifica se o jogo não está pausado
	if !isPaused:
		pass
		
	# Verifica se o botão "esq" está pressionado
	if Input.is_action_just_pressed("esq"):
		if !pause.visible:
			pause.show()
			backgroundSound.stop()
			isPaused = true  # Define a variável para true quando o jogo está pausado

func _on_Exit_Game_pressed():
	get_tree().change_scene("res://scenes/menu.tscn")

func _on_Resume_pressed():
	pause.hide()
	backgroundSound.play()
	isPaused = false  # Define a variável para false quando o jogo é retomado



func _on_Boto_dialogo_pressed():
		var dialogo_DonaMortee = Dialogic.start('timeline1')
		add_child(dialogo_DonaMortee)


func _on_enter_farm_body_entered(body):
	if body.has_method("player_enter_method"):
		get_tree().change_scene("res://scenes/farm.tscn")
