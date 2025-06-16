extends Node

@export var speed = 400

func _process(delta: float) -> void:
	var axis = Input.get_axis("Left", "Right")
	#position
