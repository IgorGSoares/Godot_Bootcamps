extends CharacterBody2D

@export var speed = 100.0
@export var patrol_points: Array[Marker2D] = []

var current_point_index = 0

@onready var detection_area: Area2D = $Area2D
var player: Node2D = null

func _ready()-> void:
	if patrol_points.size() == 0:
		print("'no pratol points asingned")


func _process(delta:float)->void:
	if player:
		chase_player()
	else:
		patrol()
	move_and_slide()


func chase_player():
	velocity = (player.global_position - global_position).normalized() * speed
	pass


func patrol():
	if patrol_points.size() > 0:
		var target = patrol_points[current_point_index].position
		velocity = (target - position).normalized() * speed
		
		if position.distance_to(target) < 10.0:
			current_point_index += 1
		if current_point_index >= patrol_points.size():
			current_point_index = 0


func _on_area_2d_body_entered(body: Node2D):
	if body.name == "Player":
		player = body
	pass # Replace with function body.


func _on_area_2d_body_exited(body: Node2D):
	if body.name == "Player":
		player = null
	pass # Replace with function body.
