extends Node

@onready var canvas: CanvasLayer = %CanvasLayer
@onready var spriteAnim: AnimationPlayer = $AnimatedSprite2D/AnimationPlayer

func _ready():
	spriteAnim.play("default")

func _on_area_2d_body_entered(body: Node2D) -> void:
	canvas._ScoreCount()
	queue_free()
	pass # Replace with function body.
