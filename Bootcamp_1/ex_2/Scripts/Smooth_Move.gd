extends CharacterBody2D

@export var speed = 300
@export var max_speed = 400
@export var acceleration = 1500 #desacceleretion = friction * delta
@export var friction = 600

@onready var spriteAnim: AnimationPlayer = $AnimatedSprite2D/AnimationPlayer

var dir = Vector2.ZERO

func _physics_process(delta):
	#get_input()
	move(delta)
	definespriteAnim()	
	move_and_slide()

func get_input():
	#if pressed one way, subtract the other to get the value of direction
	dir.x = int(Input.is_action_pressed("Right")) - int(Input.is_action_pressed("Left"))
	dir.y = int(Input.is_action_pressed("Down")) - int(Input.is_action_pressed("Up"))
	return dir.normalized()

func move(delta):
	dir = get_input()
	
	if dir == Vector2.ZERO: #not pressing anything
		
		if velocity.length() > (friction * delta): #decrease each time
			velocity -= velocity.normalized() * (friction * delta)
		else: #compleatly decreased
			velocity = Vector2.ZERO
	else:
		velocity += (dir * acceleration * delta)
		velocity = velocity.limit_length(max_speed)#stop increasing when reaches max speed
	
	#move_and_slide()

func definespriteAnim():
	if dir == Vector2.ZERO: spriteAnim.current_animation = "Idle"
	
	if dir.x != 0:
		if dir.x == 1: spriteAnim.current_animation = "Right"
		if dir.x == -1: spriteAnim.current_animation = "Left"
	if dir.y != 0:
		if dir.y == 1: spriteAnim.current_animation = "Down"
		if dir.y == -1: spriteAnim.current_animation = "Up"
	
	spriteAnim.play()
