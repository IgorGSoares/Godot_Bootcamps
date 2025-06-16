extends Node

@onready var line_edit: LineEdit = $"GAME/CanvasLayer/Input Name"
var name_city: String

var lat: String = ""
var long: String = ""


func _on_input_name_text_submitted(new_text):
	if name_city != new_text:
		name_city = new_text
		print("input")
		$HTTP.search_city(name_city)
		#$GAME/CanvasLayer/Result.text = $HTTP.result
	pass # Replace with function body.


func _on_button_lat_long_pressed():
	if lat != "" and long != "":
		$HTTP.search_coord(lat, long)
	pass # Replace with function body.


func _on_input__long_text_changed(new_text):
	long = new_text
	pass # Replace with function body.


func _on_input_lat_text_changed(new_text):
	lat = new_text
	pass # Replace with function body.
