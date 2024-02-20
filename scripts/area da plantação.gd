extends StaticBody2D

var plant = Global.plantselected
var plantgrowing = false
var plant_grown = false

# warning-ignore:unused_argument
func _physics_process(delta):
	if plantgrowing == false:
		plant = Global.plantselected

# warning-ignore:unused_argument
func _on_Area2D_area_entered(area):
	if not plantgrowing:
		if plant == 1:
			plantgrowing = true
			$guaranatimer.start()
			$plant.play("guarana fases")
		if plant == 2:
			plantgrowing = true
			$aboboratimer.start()
			$plant.play("abobora fases")

func _on_aboboratimer_timeout():
	var abobora_plant = $plant
	if abobora_plant.frame == 0:
		abobora_plant.frame = 1
		$aboboratimer.start()
	elif abobora_plant.frame == 1:
# warning-ignore:standalone_expression
		abobora_plant.frame ==2
	elif abobora_plant.frame == 2:
		abobora_plant.frame = 3
	elif abobora_plant.frame == 3:
		abobora_plant.frame = 4
		plant_grown = true


func _on_guaranatimer_timeout():
	var guarana_plant = $plant
	if guarana_plant.frame == 0:
		guarana_plant.frame = 1
		$guaranatimer.start()
	elif guarana_plant.frame == 1:
		guarana_plant.frame = 2
	elif guarana_plant.frame == 2:
		guarana_plant.frame = 3
	elif guarana_plant.frame == 3:
		guarana_plant.frame = 4
		plant_grown = true


# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("left_click"):
		if plant_grown:
			if plant == 1:
				Global.numofguaranas += 1
				plantgrowing = false
				plant_grown = false
				$plant.play("vazio")
			if plant == 2:
				Global.numofaboboras += 1
				plantgrowing = false
				plant_grown = false
				$plant.play("vazio")
			else:
				pass
