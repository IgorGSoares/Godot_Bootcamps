extends Node

@export var sprite_pause: Texture
@export var sprite_play: Texture

@onready var btn_effect: AudioStreamPlayer2D = $AudioEffect
@onready var background_sound: AudioStreamPlayer2D = $"../Background"
@onready var sprite: Sprite2D = $Sprite2D

var temp = 0

func _input_event(viewport, event, shape_index): #use action system
	if event.is_action_pressed("click"):
		print("click entered")
		btn_effect.play()
		if(sprite.texture == sprite_play):
			sprite.texture = sprite_pause
			temp = background_sound.get_playback_position( )
			background_sound.stop()
		else:
			sprite.texture = sprite_play
			background_sound.play(temp)
