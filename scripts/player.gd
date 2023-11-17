extends KinematicBody2D

#Variaveis
export var moveSpeed = 100
var collision = null

#Movimento de controle do player

func _physics_process(delta):
	var moveVector = Vector2()
	
	if Input.is_action_pressed("right"):
		moveVector.x += 1

		
		$AnimatedSprite.play("sidewalk-dir")
		
	elif Input.is_action_pressed("left"):
		moveVector.x -= 1

		
		$AnimatedSprite.play("sidewalk-esq")
		
	elif Input.is_action_pressed("down"):
		moveVector.y += 1
		
		$AnimatedSprite.play("down_walk")
		
	elif Input.is_action_pressed("up"):
		moveVector.y -= 1
		
		$AnimatedSprite.play("up_walk")
	
	else:
		$AnimatedSprite.play("default")
		
		moveVector.x = 0
		moveVector.y = 0
	collision = move_and_collide(moveVector.normalized() * delta * moveSpeed)
	
# move_and_slide é uma função construtora da Godot que aplica o movimento ao personagem mas também o processo físico que checa as colisões. (2 funções combinadas)
#Diferente do anterior move_and_slide, o move_and_collide deixa o personagem estatico ao colidir.
