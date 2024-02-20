extends Node2D

func _physics_process(delta):
	$UserInterface/estatisticas/guaranatext.text = ("= " + str(Global.numofguaranas))
	$UserInterface/estatisticas/aboboratext.text = ("= " + str(Global.numofaboboras))
