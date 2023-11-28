extends Panel

var empty_tex = preload("res://assets/UI Player/Inventory/Slot Empty.png")
var filled_tex = preload("res://assets/UI Player/Inventory/Slot Filled.png")

var empty_style: StyleBoxTexture = null
var filled_style: StyleBoxTexture = null

var ItemClass = preload("res://scenes/item.tscn")
var item = null

func _ready():
	empty_style = StyleBoxTexture.new()
	filled_style = StyleBoxTexture.new()
	empty_style.texture = empty_tex
	filled_style.texture = filled_tex
	
	if randi() % 2 == 0:
		item = ItemClass.instance()
		add_child(item)
	refresh_style()

func refresh_style():
	if item == null:
		set('custom_styles/panel', empty_style)
	else:
		set('custom_styles/panel', filled_style)

func pickFromSlot():
	remove_child(item)
	var inventoryNode = find_parent("inventory")
	inventoryNode.add_child(item)
	item = null
	refresh_style()

func putIntoSlot(new_item):
	item = new_item
	item.position = Vector2(0,0)
	var inventoryNode = find_parent("inventory")
	inventoryNode.remove_child(item)
	add_child(item)
	refresh_style()
	
