extends KinematicBody2D

# Variáveis
export var moveSpeed = 100
var collision = null
var running = 1
onready var lastDirection: Vector2 = Vector2.ZERO #Variavel para verificar a ultima direção de seta feito pelo jogador
#var isWatering = false  # Variável para rastrear se o jogador está regando

onready var movementSound = $Som_caminhada
func _ready():
	pass

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
	
	
	#Verifica a ação de regar
	if Input.is_action_pressed("regando"):
		$AnimatedSprite.play("rega_dir")
		#isWatering = true
	#else:
	#	isWatering = false
	
	#Atualiza a ultima direção 
	if moveVector.length() > 0:
		lastDirection = moveVector.normalized() 
	
	#Ajusta a taxa de reprodução do som durante a corrida
	if Input.is_action_pressed("run"):
		movementSound.pitch_scale = 2.0  # Aumenta a taxa de reprodução para dobrar a velocidade
	else:
		movementSound.pitch_scale = 1.0  # Volta para a taxa de reprodução normal

	if moveVector.length() == 0:
		# Deixa o personagem parado na última direção
		if lastDirection.length() > 0:
			$AnimatedSprite.play(get_animation_from_direction(lastDirection))
	
	#Verifica se ta regando
	#if isWatering:
		# Reproduz a animação de regar na última direção
		#$AnimatedSprite.play("rega_" + get_animation_from_direction(lastDirection))
	#elif moveVector.length() == 0:
		# Deixa o personagem parado na última direção
		#if lastDirection.length() > 0:
			#$AnimatedSprite.play(get_animation_from_direction(lastDirection))
	#else:
		# Toca a animação de movimento conforme a direção
		#$AnimatedSprite.play(get_animation_from_direction(moveVector))


#Toca o som de movimento se algum botão de movimento estiver sendo pressionado
	if moveVector.length() > 0:
		if not movementSound.is_playing():
			movementSound.play()

	if moveVector.x == 0:
		if moveVector.y < 0:
			if running == 1:
				$AnimatedSprite.play("up_walk")
			elif running == 2:
				$AnimatedSprite.play("up_run")
		elif moveVector.y > 0:
			if running == 1:
				$AnimatedSprite.play("down_walk")
			elif running == 2:
				$AnimatedSprite.play("down_run")
	else:
		if moveVector.x > 0:
			if running == 1:
				$AnimatedSprite.play("dir_walk")
			elif running == 2:
				$AnimatedSprite.play("dir_run")
		elif moveVector.x < 0:
			if running == 1:
				$AnimatedSprite.play("esq_walk")
			elif running == 2:
				$AnimatedSprite.play("esq_run")


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

func player_sell_method():
	pass

func player_buy_method():
	pass

func player_enter_method():
	pass

func player_exit_method():
	pass
