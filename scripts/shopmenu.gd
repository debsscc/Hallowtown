extends StaticBody2D

#item = [0, 1, ...] string
var item = ["abobora", "regador"]
var price 

#preços dos itens = [0, 1, ...] int
var itemprice = [100, 999]

#guarda se possui ou nao o item = [0, 1, ...] bool
var itemowned = [false, false]

func _ready():
	$itemicon.play("aboboraseed")
	item = [0]

func _physics_process(delta):
	if self.visible == true:
		if item == [0]:
			$itemicon.play("aboboraseed")
			$price.text = "x100"
			if Global.coins >= itemprice[0]:
				if itemowned[0] == false:
					$buyicon.play("canbuy")
				else:
					$buyicon.play("cannotbuy")
			else:
				$buyicon.play("cannotbuy")
		if item == [1]:
			$itemicon.play("regador")
			$price.text = "x999"
			if Global.coins >= itemprice[1]:
				if itemowned[1] == false:
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
	if item == [0]:
		price = itemprice[0]
		if Global.coins >= price:
			if itemowned[0] == false:
				buy()
	if item == [1]:
		price = itemprice[1]
		if Global.coins >= price:
			if itemowned[1] == false:
				buy()

func swap_item_back():
	if item == [0]:
		item = [1]
	elif item == [1]:
		item = [0]

func swap_item_forward():
	if item == [0]:
		item = [1]
	elif item == [1]:
		item = [0]

func buy():
	Global.coins -= price
	if item == [0]:
		itemowned[0] = true
	if item == [1]:
		itemowned[1] = true
