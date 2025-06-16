extends HSlider

var scroll_value: int

func _ready() -> void:
	value_changed.connect(_on_value_changed)#connect signal trough code

func _on_value_changed(value: float) -> void:
	#var a = { "scroll value is: ": scroll_value}
	#print(var_to_str(a))
	#print(value)
	pass

func _setValue(v: float) -> void:
	print(v)
	$".".value = v
