extends Node2D

var score = {
	"first": 0,
	"second": 0,
	"third": 0,
	"forth": 0,
	"fifth": 0,
}

#@onready var sql_manager = $"../SQL"

func _ready():
	#$"../SQL".create_table()
	pass

func _on_text_edit_text_submitted(new_text):
	#print(score)
	var result = text_check()
	if result: score_update()
	#print(score)
	#print(score["1"])

func text_check() -> bool:
	var result = false
	if $"../CanvasLayer/TextEdit".text.is_valid_int(): result = true
	#print(result)
	return result

func score_update():
	var value = int($"../CanvasLayer/TextEdit".text)
	var old_value = 0
	for x in score:
		#var y = x+1
		if value > score[x]:
			old_value = score[x]
			score[x] = value
			value = old_value
		if value == score[x]: break
	
	$"../CanvasLayer/Score".text = str(score)
	#print("score update")
	#var t = str(score)
	#print(t)


func _on_save_pressed():
	score_update()
	$"../SQL".create_table()
	
	$"../SQL".insert_data(score)
	pass # Replace with function body.


func _on_load_pressed():
	#$"../SQL".load_data()
	var data = $"../SQL".load_data()
	for x in score.size():
		#get_venue_state(10)
		score[x] = data[x]
		print(score[x])
		
	print("score 5 is:" + str(score[4]))
	#print(score)
	#score_update()
	pass # Replace with function body.
