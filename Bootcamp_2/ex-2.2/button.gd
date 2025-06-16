extends Area2D


@export var sprite_pause: Texture
@export var sprite_play: Texture

@onready var sprite: Sprite2D = $Sprite2D

func _input_event(viewport, event, shape_index): #use action system
	if event.is_action_pressed("Click"):
		print("click entered")
		if(sprite.texture == sprite_play):
			sprite.texture = sprite_pause
		else:
			sprite.texture = sprite_play
