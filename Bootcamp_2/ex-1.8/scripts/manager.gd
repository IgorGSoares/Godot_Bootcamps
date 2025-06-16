extends Node2D

@onready var canvas_layer: CanvasLayer = %CanvasLayer

func _ready():
	_load()


func _on_save_game_pressed():
	_save()


func _save() -> void:
	var record = canvas_layer._GetScore()
	
	if FileAccess.file_exists("res://save.json"):
		var jsonFileCheck = FileAccess.open("res://save.json", FileAccess.READ)
		var jsonText = jsonFileCheck.get_as_text()
		var dataCheck = JSON.parse_string(jsonText)
		jsonFileCheck.close()
		if record < dataCheck.record:
			print("record is lower than last score")
			print(record)
			print(dataCheck.record)
			return
	
	var jsonFile = FileAccess.open("res://save.json", FileAccess.WRITE)
	
	var data = {
		"record": record
	}
	var jsonString = JSON.stringify(data)
	
	jsonFile.store_line(jsonString)
	jsonFile.close()

func _load() -> void:
	if not FileAccess.file_exists("res://save.json"):
		return
	
	var jsonFile = FileAccess.open("res://save.json", FileAccess.READ)
	var jsonString = jsonFile.get_as_text()
	jsonFile.close()
	
	var data = JSON.parse_string(jsonString)
	
	canvas_layer._RecordScore(data.record)
	print(data.record)
