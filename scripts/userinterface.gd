extends CanvasLayer

func _input(event):
	if event.is_action_pressed("inventory"):
		$inventory.visible = !$inventory.visible
		$inventory.initialize_inventory()

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
