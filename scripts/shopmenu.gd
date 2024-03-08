extends StaticBody2D

#item 1 = abobora | item 2 = coracao
var item = 1
var price 

#preços dos itens
var item1price = 100
var item2price = 999

#guarda se possui ou nao o item
var item1owned = false
var item2owned = false

func _ready():
	$itemicon.play("aboboraseed")
	item = 1

func _physics_process(delta):
	if self.visible == true:
		if item == 1:
			$itemicon.play("aboboraseed")
			$price.text = "x100"
			if Global.coins >= item1price:
				if item1owned == false:
					$buyicon.play("canbuy")
				else:
					$buyicon.play("cannotbuy")
			else:
				$buyicon.play("cannotbuy")
		if item == 2:
			$itemicon.play("coracaoseed")
			$price.text = "x999"
			if Global.coins >= item2price:
				if item2owned == false:
					$buyicon.play("canbuy")
				else:
					$buyicon.play("cannotbuy")
			else:
				$buyicon.play("cannotbuy")

func _on_buttonleft_pressed():
	swap_item_back()

func _on_buttonright_pressed():
	swap_item_forward()

func _on_buybutton_pressed():
	if item == 1:
		price = item1price
		if Global.coins >= price:
			if item1owned == false:
				buy()
	if item == 2:
		price = item2price
		if Global.coins >= price:
			if item2owned == false:
				buy()

func swap_item_back():
	if item == 1:
		item = 2
	elif item == 2:
		item = 1

func swap_item_forward():
	if item == 1:
		item = 2
	elif item == 2:
		item = 1

func buy():
	Global.coins -= price
	if item == 1:
		item1owned = true
	if item == 2:
		item2owned = true
