extends Area2D

#@export var sound: AudioStream
@onready var canvas_layer: CanvasLayer = %CanvasLayer

func _ready():
	pass

func _on_body_entered(body: Node2D) -> void:
	#score +=1
	print_debug("colides")
	#audioStream.stream = sound
	$AudioStreamPlayer2D.play()
	canvas_layer._ScoreCount()
	$".".visible = false
	#%Manager._increase_record()
	#queue_free()


func _on_audio_stream_player_2d_finished():
	queue_free()
	pass # Replace with function body.
