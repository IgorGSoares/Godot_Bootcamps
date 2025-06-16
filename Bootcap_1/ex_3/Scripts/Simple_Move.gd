extends CharacterBody2D

@export var speed = 400

func get_input():
	var dir = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = dir.normalized() * speed
	#velocity = dir * speed


func _physics_process(delta):
	get_input()
	move_and_slide()
