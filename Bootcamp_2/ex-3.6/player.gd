extends CharacterBody2D

const SPEED = 300.0


func _physics_process(delta):
	var dir = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = dir.normalized() * SPEED

	move_and_slide()
