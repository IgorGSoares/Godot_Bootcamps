extends CharacterBody2D

const SPEED = 300 #150
const JUMP_VELOCITY = -550.0 #-200

#@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var index: int = 0
@export var input_left: String
@export var input_right: String
@export var input_up: String


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta


	if Input.is_action_just_pressed(input_up) and is_on_floor():
		velocity.y = JUMP_VELOCITY
		#animated_sprite_2d.play("Jump")

	var direction := Input.get_axis(input_left, input_right)
	if direction != 0:
		#animated_sprite_2d.play("Run")
		#if(direction > 0): animated_sprite_2d.flip_h = false
		#if(direction < 0): animated_sprite_2d.flip_h = true
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		#animated_sprite_2d.play("Idle")

	move_and_slide()
