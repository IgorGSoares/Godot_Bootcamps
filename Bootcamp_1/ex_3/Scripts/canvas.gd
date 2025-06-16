extends CanvasLayer

var score = 0

@onready var label: Label = $GridContainer/Label

func _ScoreCount():
	score += 1
	print(score)
	label.text = "Coins: " + str(score)
