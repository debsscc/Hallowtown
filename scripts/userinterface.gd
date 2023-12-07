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
	elif event.is_action_pressed("1"):
		PlayerInventory.active_item_1()
	elif event.is_action_pressed("2"):
		PlayerInventory.active_item_2()
	elif event.is_action_pressed("3"):
		PlayerInventory.active_item_3()
	elif event.is_action_pressed("4"):
		PlayerInventory.active_item_4()
	elif event.is_action_pressed("5"):
		PlayerInventory.active_item_5()
	elif event.is_action_pressed("6"):
		PlayerInventory.active_item_6()
	elif event.is_action_pressed("7"):
		PlayerInventory.active_item_7()
	elif event.is_action_pressed("8"):
		PlayerInventory.active_item_8()
	elif event.is_action_pressed("9"):
		PlayerInventory.active_item_9()
	elif event.is_action_pressed("0"):
		PlayerInventory.active_item_0()
