extends Control

onready var video_introducao = $"Introducao-Abobora"
onready var audio_introducao = $AudioStreamPlayer
onready var tutorial = $tutorial


func _ready():
	video_introducao.hide()
	video_introducao.stop()
	tutorial.stop()
	
func _physics_process(delta):
	if Input.is_action_pressed("enter"):
		get_tree().change_scene("res://scenes/main.tscn")

func _on_Button_pressed():
	$AudioStreamPlayer.stop()
	video_introducao.show()
	video_introducao.play()
	$Button.hide()

func _on_IntroducaoAbobora_finished():
	tutorial.play()

func _on_tutorial_finished():
	get_tree().change_scene("res://scenes/main.tscn")
