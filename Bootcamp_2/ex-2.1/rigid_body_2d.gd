extends RigidBody2D

#const SPEED = 150.0
#var velocity: Vector2 = Vector2.ZERO

@export var force: float = 0 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction := Input.get_axis("Left", "Right")
	if direction != 0:
		#velocity.x = direction * SPEED
		var f = Vector2.RIGHT * force
		var dir = Vector2.RIGHT * direction
		print(dir)
		#apply_force(f*dir.x, dir)
		apply_central_force(f * dir.x)
	#else:
		#print(Vector2.RIGHT)
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	#move_and_slide()
