extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -200.0

@onready var animPlayer: AnimationPlayer = $AnimatedSprite2D/AnimationPlayer
@onready var animSprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animPlayer.play("Jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction != 0:
		animPlayer.play("Run")
		if(direction > 0): animSprite.flip_h = false
		if(direction < 0): animSprite.flip_h = true
		#print("enterr if")
		velocity.x = direction * SPEED
	else:
		#print("enter else")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animPlayer.play("Idle")

	#animPlayer.play("Idle")

	move_and_slide()
