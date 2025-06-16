extends Camera2D

@export var player: NodePath

func _ready():
	set_process(true)


func _process(delta):
	if player:
		var player_node = get_node(player)
		global_position.x = player_node.global_position.x
