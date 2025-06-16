extends Sprite2D


func _on_time_slider_value_changed(value):
	#print(value)
	material.set_shader_parameter("timer_multiplyer", value)
	#print(material.get_shader_parameter("timer_multiplyer"))
	#material.get_shader_parameter("timer_multiplyer") = value
	pass # Replace with function body.


func _on_frequency_slider_value_changed(value):
	#material.wave_noise.noise.frequency = value
	material.get_shader_parameter("wave_noise").noise.frequency = value
	print(material.get_shader_parameter("wave_noise").noise.frequency)
	pass # Replace with function body.
