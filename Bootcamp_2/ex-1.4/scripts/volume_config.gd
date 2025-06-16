extends HSlider

#https://www.youtube.com/watch?v=aFkRmtGiZCw

@onready var audio: AudioStreamPlayer2D = $"../../../../AudioStreamPlayer2D"
@export var bus_name: String

var bus_index: int

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	
	#AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	#var a = { "value is: ": AudioServer.get_bus_volume_db(bus_index)}
	#print(var_to_str(a))
	
	#value_changed.connect(_on_value_changed) #connect signal trough code

func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	#var a = { "value is: ": AudioServer.get_bus_volume_db(bus_index)}
	#print(var_to_str(a))


func _setValue(v: float) -> void:
	#$"../../../../AudioStreamPlayer2D".stop()
	print(v)
	$".".value = v
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(v))
	#$"../../../../AudioStreamPlayer2D".play()
