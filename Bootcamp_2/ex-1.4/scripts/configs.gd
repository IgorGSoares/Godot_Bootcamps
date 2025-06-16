extends Node

var volume: float
var bright: float

@onready var scroll_vol: HSlider = $"../CanvasLayer/Control/GridContainer/HSlider"
@onready var scroll_bright : HSlider = $"../CanvasLayer/Control/GridContainer2/HSlider"

func _ready():
	_load()

func _on_button_pressed():
	_save()


func _on_volume_slider_value_changed(value):
	volume = value


func _on_bright_slider_value_changed(value):
	bright = value


func _save() -> void:
	var data = {
		"volume": volume,
		"bright": bright
	}

	var jsonString = JSON.stringify(data)
	var jsonFile = FileAccess.open("res://save.json", FileAccess.WRITE)
	jsonFile.store_line(jsonString)
	jsonFile.close()
	
	print("game saved")

func _load() -> void:
	if not FileAccess.file_exists("res://save.json"):
		print("file not found")
		#$"../AudioStreamPlayer2D".play()
		return
	
	print("file found")
	
	var jsonFile = FileAccess.open("res://save.json", FileAccess.READ)
	var jsonString = jsonFile.get_as_text()
	jsonFile.close()
	
	var data = JSON.parse_string(jsonString)
	volume = data.volume
	bright = data.bright
	
	scroll_vol._setValue(volume)
	scroll_bright._setValue(bright)
	#print(volume)
