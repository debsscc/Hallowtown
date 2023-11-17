extends KinematicBody2D

#Variaveis
var speed = 50
var motion = Vector2.ZERO

#Movimento de controle do player

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		motion.x = speed

		
		$AnimatedSprite.play("sidewalk-dir")
		$AnimatedSprite.flip_h = false
		
	elif Input.is_action_pressed("left"):
		motion.x = -speed

		
		$AnimatedSprite.play("sidewalk-esq")
		
	elif Input.is_action_pressed("down"):
		motion.y = speed

		
		$AnimatedSprite.play("down_walk")
		
	elif Input.is_action_pressed("up"):
		motion.y = -speed

		
		$AnimatedSprite.play("up_walk")
		
	else:
		$AnimatedSprite.play("default")
		
		motion.x = 0
		motion.y = 0
	
	move_and_slide(motion)
	
# move_and_slide é uma função construtora da Godot que aplica o movimento ao personagem mas também o processo físico que checa as colisões. (2 funções combinadas)
