extends StaticBody2D


func _on_Area2D_body_entered(body):
	if body.has_method("player_sell_method"):
		var guarana = Global.numofguaranas
		var abobora = Global.numofaboboras
		var coins = Global.coins
		
		#moedas a serem adicionadas após a venda
		#abobora = 10 | guarana = 15 coins
		coins += abobora*3
		coins += guarana*6
		
		#zerar os itens vendidos
		abobora = 0
		guarana = 0
		
		#atualiza a quantidade de itens
		Global.coins = coins
		Global.numofaboboras = abobora
		Global.numofguaranas = guarana
