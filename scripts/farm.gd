extends Node2D

onready var backgroundSound = $som_background

var pause = pause
var isPaused = false #Variavel que rastreia se o jogo ta pausado

func _ready():
	pause = $UserInterface/pause
	pause.hide()

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

func _on_exit_farm_body_entered(body):
	if body.has_method("player_exit_method"):
		get_tree().change_scene("res://scenes/main.tscn")

func _on_Dialogo_frank_pressed():
	var dialogoFrank = Dialogic.start('frankie')
	add_child(dialogoFrank)

func _on_enter_casinha_body_entered(body):
	if body.has_method("player_enter_method"):
		get_tree().change_scene("res://scenes/casa.tscn")
