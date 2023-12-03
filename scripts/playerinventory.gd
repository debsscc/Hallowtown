extends Node

signal active_item_updated

const ItemClass = preload("res://scripts/item.gd")
const SlotClass = preload("res://scripts/slot.gd")
const NUM_INVENTORY_SLOTS = 20
const NUM_HOTBAR_SLOTS = 10

var inventory = {
	0: ["Watering Can", 1], #[item_name, quantity_item]
	1: ["Hoe", 1],
	2: ["Guarana Seed", 39],
	3: ["Guarana Seed", 90],
}

var hotbar = {
	0: ["Watering Can", 1], #[item_name, quantity_item]
	1: ["Hoe", 1],
	2: ["Guarana Seed", 39],
	3: ["Guarana Seed", 90],
}

var active_item_slot = 0

func add_item(item_name, item_quantity):
	for item in inventory:
		if inventory[item][0] == item_name:
			var stack_size = int(JSONdata.item_data[item_name]["StackSize"])
			var able_to_add = stack_size - inventory[item][1]
			if able_to_add >= item_quantity:
				inventory[item][1] += item_quantity
				update_slot_visual(item, inventory[item][0], inventory[item][1])
				return
			else:
				inventory[item][1] += able_to_add
				update_slot_visual(item, inventory[item][0], inventory[item][1])
				item_quantity = item_quantity - able_to_add
	
	#se não existe o item no inventário, adicionar a um slot vazio
	for i in range(NUM_INVENTORY_SLOTS):
		if inventory.has(i) == false:
			inventory[i] = [item_name, item_quantity]
			update_slot_visual(i, inventory[i][0], inventory[i][1])
			return

func update_slot_visual(slot_index, item_name, new_quantity):
	var slot = get_tree().root.get_node("/root/main/UserInterface/inventory/GridContainer/Slot" + str(slot_index + 1))
	if slot.item != null:
		slot.item.set_item(item_name, new_quantity)
	else:
		slot.initialize_item(item_name, new_quantity)

func remove_item(slot: SlotClass, is_hotbar: bool = false):
	if is_hotbar:
		hotbar.erase(slot.slot_index)
	else:
		inventory.erase(slot.slot_index)

func add_item_to_empty_slot(item: ItemClass, slot: SlotClass, is_hotbar: bool = false):
	if is_hotbar:
		hotbar[slot.slot_index] = [item.item_name, item.item_quantity]
	else:
		inventory[slot.slot_index] = [item.item_name, item.item_quantity]

func add_item_quantity(slot: SlotClass, quantity_to_add: int, is_hotbar: bool = false):
	if is_hotbar:
		hotbar[slot.slot_index][1] += quantity_to_add
	else:
		inventory[slot.slot_index][1] += quantity_to_add

func active_item_scroll_down():
	active_item_slot = (active_item_slot +1) % NUM_HOTBAR_SLOTS
	emit_signal("active_item_updated")

func active_item_scroll_up():
	if active_item_slot == 0:
		active_item_slot == NUM_HOTBAR_SLOTS - 1
	else:
		active_item_slot -= 1
	emit_signal("active_item_updated")
