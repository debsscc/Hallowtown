extends Control

func _physics_process(delta):
	if Input.is_action_pressed("enter"):
		get_tree().change_scene("res://scenes/main.tscn")


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/main.tscn")
