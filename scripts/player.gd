extends KinematicBody2D

#Variaveis
export var moveSpeed = 100
var collision = null
var running = 1

onready var Inventory = get_node("UI/Inventory")

onready var ShopMenu = get_node("/root/main/Shop Menu")

#Movimento de controle do player

func _physics_process(delta):
	var moveVector = Vector2()
	
	if Input.is_action_pressed("right"):
		moveVector.x += 1
		
	if Input.is_action_pressed("left"):
		moveVector.x -= 1
		
	if Input.is_action_pressed("down"):
		moveVector.y += 1
		
	if Input.is_action_pressed("up"):
		moveVector.y -= 1
	
	if moveVector.x == 0:
		if moveVector.y < 0:
			$AnimatedSprite.play("up_walk")
		elif moveVector.y > 0:
			$AnimatedSprite.play("down_walk")
	else:
		if moveVector.x > 0:
			$AnimatedSprite.play("sidewalk-dir")
		elif moveVector.x < 0:
			$AnimatedSprite.play("sidewalk-esq")
	
	if (moveVector.x == 0 and moveVector.y == 0):
		$AnimatedSprite.play("default")

# move_and_slide é uma função construtora da Godot que aplica o movimento ao personagem mas também o processo físico que checa as colisões. (2 funções combinadas)
#Diferente do anterior move_and_slide, o move_and_collide deixa o personagem estatico ao colidir.

	#Verifica se a tecla de corrida está sendo pressionada
	if Input.is_action_pressed("run"):
		running = 2

	else:
		running = 1
		
	#Atualiza a velocidade de acordo com a condição de corrida
	if running: 
		moveVector *= 2 #Dobra a velocidade se a corrida estiver ativa
		
  # Mensagem de depuração
	collision = move_and_collide(moveVector.normalized() * delta * moveSpeed * running)




