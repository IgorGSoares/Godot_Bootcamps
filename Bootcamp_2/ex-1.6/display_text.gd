extends CanvasLayer

@onready var label: Label = $Label


func _on_button_1_pressed():
	label.text = "Numb 1"

func _on_button_2_pressed():
	label.text = "Numb 2"
