extends Node

@onready var audio: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"

func _input_event(viewport, event, shape_index): #use action system
	if event.is_action_pressed("click"):
		print("click entered")
		audio.play()


func _input(event:InputEvent): #detect input event (is faster than above)
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("click entered 2")
			#audio.play()
