extends CanvasLayer

var holding_item = null

func _input(event):
	if event.is_action_pressed("inventory"):
		$inventory.visible = !$inventory.visible
		$inventory.initialize_inventory()
	if event.is_action_pressed("scroll_up"):
		PlayerInventory.active_item_scroll_up()
	elif event.is_action_pressed("scroll_down"):
		PlayerInventory.active_item_scroll_down()

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
