extends StaticBody2D

var state = "day" #day night

var change_state = false

var length_of_day = 20 #sec
var length_of_night = 8 #sec


func _ready(): 
	if state == "day":
		$ColorRect.color.a = 0
	if state == "night":
		$ColorRect.color.a = 150

func _on_Timer_timeout():
	if state == "day":
		state = "night"
		change_to_night()
		$Timer.wait_time = length_of_night

	elif state == "night":
		state = "day"
		change_to_day()
		$Timer.wait_time = length_of_day
		
	$Timer.start()
	change_state = true
	
func _process(delta):
	if change_state:
		change_state = false

func change_to_day():
	$AnimationPlayer.play("noite_pra_dia")  # Play de animação da noite pro dia

func change_to_night():
	$AnimationPlayer.play("dia_para_noite")  # Play da animação do dia pra noite
