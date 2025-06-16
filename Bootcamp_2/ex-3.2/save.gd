extends Node2D

@export var points: int = 0
@export var items: int = 0

var crypto
@export var key_public: String = "-9223372008635497191"
@export var key_private: String = "-9223372008652274407"


func _ready():
	_initialize_crypto()


func _initialize_crypto():
	
	print("public key is: " + str(key_public))
	print("private key is: " + str(key_private))
	
	#path: C:\Users\LocalUser\AppData\Roaming\Godot\app_userdata\Bootcamp 3.2


func _save(data_1, data_2, filename, acess) -> void:
	var data = {
		"data_1": data_1,
		"data_2": data_2
	}
	
	var key
	if acess == true: key = key_public
	else: key = key_private
	
	var jsonFile = FileAccess.open_encrypted_with_pass(filename, FileAccess.WRITE, key)
	jsonFile.store_string(JSON.stringify(data))
	jsonFile.close()
	
	print("game saved")

func _load(filename) -> void:
	if not FileAccess.file_exists(filename):
		print("file not found")
		#$"../AudioStreamPlayer2D".play()
		return
	
	print("file found")
	
	var jsonFile = FileAccess.open_encrypted_with_pass(filename, FileAccess.READ, key_private)
	var data = JSON.parse_string(jsonFile.get_as_text())
	jsonFile.close()
	
	print(data)
	
	points = data.data_1
	items = data.data_2
	print(points)
	print(items)


func _on_save_pressed():
	_save(points, items, "res://save_public.json", true)
	_save(points, items, "res://save_private.json", false)
	pass # Replace with function body.


func _on_load_pressed():
	_load("res://save_private.json")
	pass # Replace with function body.
