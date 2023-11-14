extends KinematicBody2D

#Variaveis
var velocity : Vector2 = Vector2()
var direction : Vector2 = Vector2()

#Movimento de controle do player

func read_input():
	velocity = Vector2()
	
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		direction = Vector2(0, -1)
	
	if Input.is_action_pressed("down"):
		velocity.y += 1
		direction = Vector2(0, 1)
		
	if Input.is_action_pressed("right"):
		velocity.x += 1
		direction = Vector2(1, 0)
		
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		direction = Vector2(-1,0)
		
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity * 200)
	
# move_and_slide é uma função construtora da Godot que aplica o movimento ao personagem mas também o processo físico que checa as colisões. (2 funções combinadas)

	
func _physics_process(_delta):
	read_input()
