extends Node2D

onready var backgroundSound = $som_background
onready var audio_donaMorte = $Dona_MorteSFX
onready var regando = $Ysort/Entidades/Player/AnimatedSprite
onready var ui = $UserInterface/player_ui
onready var introducao_video = $VideoINT

var pause = pause
var isPaused = false #Variavel que rastreia se o jogo ta pausado


func _ready():
	pause = $UserInterface/pause
	pause.hide()
	ui.hide()

	if Input.is_action_just_pressed("regando"):
		$AnimatedSprite.play("rega_down")

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
		ui.show()

func _on_enter_farm_body_entered(body):
	if body.has_method("player_enter_method"):
		get_tree().change_scene("res://scenes/farm.tscn")


func _on_VideoINT_finished():
	introducao_video.hide()
