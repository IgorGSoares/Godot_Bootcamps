extends Area2D

var mouseOver: bool
var mousePos: Vector2 = Vector2.ZERO
var difference: Vector2

func _process(delta):
	difference = mousePos - get_global_mouse_position()
	
	if Input.is_action_pressed("Click") and mouseOver and difference != Vector2.ZERO:
		global_position -= difference
	
	if Input.is_action_just_released("Click") and mouseOver:
		var random_colour = Color(randf(), randf(), randf(), 1)
		$Sprite2D.modulate = random_colour
	
	mousePos = get_global_mouse_position()


func _on_mouse_entered():
	mouseOver = true


func _on_mouse_exited():
	mouseOver = false
