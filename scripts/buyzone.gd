extends StaticBody2D

func _ready():
	$shopmenu.visible = false

func _process(delta):
	if $shopmenu.item1owned == true:
		$semente_de_abobora. visible = true

func _on_Area2D_body_entered(body):
	if body.has_method("player_buy_method"):
		$shopmenu.visible = true

func _on_Area2D_body_exited(body):
	if body.has_method("player_buy_method"):
		$shopmenu.visible = false
