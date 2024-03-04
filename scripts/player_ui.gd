extends Node2D

func _physics_process(delta):
	$guaranatext.text = ("x" + str(Global.numofguaranas))
	$aboboratext.text = ("x" + str(Global.numofaboboras))
	$moedastext.text = ("x" + str(Global.coins))
