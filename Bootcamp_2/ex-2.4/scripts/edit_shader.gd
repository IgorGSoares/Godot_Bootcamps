extends Sprite2D

@export var blue_value = 1.0

func _ready():
	material.set_shader_parameter("blue", blue_value)
	pass # Replace with function body.


func _process(delta):
	pass
