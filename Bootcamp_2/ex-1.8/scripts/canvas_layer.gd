extends CanvasLayer

var score = 0
@onready var label_score: Label = $Placar/Points

func _ScoreCount():
	score += 1
	label_score.text = "Points: " + str(score)

func _RecordScore(points: int) -> void:
	$Placar/Record.text = "Record: " + str(points)

func _GetScore() -> int:
	return score
