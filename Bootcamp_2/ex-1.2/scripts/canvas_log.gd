extends Node

@onready var label: Label = $GridContainer/Label

var cur_state = true

func display_song_state():
	if(cur_state == false):
		label.text = "Music Off"
	else:
		label.text = "Music On"

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		#print("click entered 2")
		cur_state = !cur_state
		display_song_state()
