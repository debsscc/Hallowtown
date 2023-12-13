extends KinematicBody2D

# Variáveis
export var moveSpeed = 100
var collision = null
var running = 1
onready var lastDirection: Vector2 = Vector2.ZERO

onready var Game = get_node("/root/main")
onready var Inventory = get_node("UI/Inventory") 
onready var EnergyBar = get_node("UI/Energy Bar")
onready var ShopMenu = get_node("/root/main/Loja/Shop Menu")

onready var movementSound = $Som_caminhada

func get_animation_from_direction(direction: Vector2) -> String:
	if direction.y < 0:
		return "up"
	elif direction.y > 0:
		return "down"
	elif direction.x > 0:
		return "dir"
	elif direction.x < 0:
		return "esq"
	else:
		return "default"

# Função para parar o som de movimento quando não há mais entrada de movimento
func _stop_movement_sound():
	if movementSound.is_playing():
		movementSound.stop()

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
	
	if moveVector.length() > 0:
		lastDirection = moveVector.normalized()  # Atualiza a última direção
	
	#Ajusta a taxa de reprodução do som durante a corrida
	if Input.is_action_pressed("run"):
		movementSound.pitch_scale = 2.0  # Aumenta a taxa de reprodução para dobrar a velocidade
	else:
		movementSound.pitch_scale = 1.0  # Volta para a taxa de reprodução normal

	if moveVector.length() == 0:
		# Deixa o personagem parado na última direção
		if lastDirection.length() > 0:
			$AnimatedSprite.play(get_animation_from_direction(lastDirection))

#Toca o som de movimento se algum botão de movimento estiver sendo pressionado
	if moveVector.length() > 0:
		if not movementSound.is_playing():
			movementSound.play()

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

	if Input.is_action_pressed("run"):
		running = 2
	else:
		running = 1

	moveVector *= 2 * running

	collision = move_and_collide(moveVector.normalized() * delta * moveSpeed * running)

	# Collision with Checkpoint
	if collision and Input.is_action_pressed("run"):  # Só ajusta a posição se o jogador estiver correndo
		_on_Area2D_body_entered(collision.collider)

	#Chama a função de parar o som quando não há mais entrada de movimento
	if moveVector.length() == 0:
		_stop_movement_sound()

# Collision with Checkpoint
func _on_Area2D_body_entered(body):
	print("Body entered")
	if body == $Player:
		position -= collision.normal * collision.travel


