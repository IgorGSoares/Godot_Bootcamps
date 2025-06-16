extends Sprite2D

var dragging = false
var of = Vector2.ZERO

func _process(delta):
	if dragging:
		position = get_global_mouse_position() - of


func _on_button_button_up():
	dragging = false


func _on_button_button_down():
	dragging = true


func _on_button_pressed():
	var random_colour = Color(randf(), randf(), randf(), 1)
	$".".modulate = random_colour
