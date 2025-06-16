extends Area2D

@export var id: int
@export var item_name: String = ""
@export var item_qtd: int = 0

func _process(delta):
	$Label.text = item_name + " x" + str(item_qtd)
	pass

func update_item(qtd):
	print(qtd)
	item_qtd = qtd

func _input_event(viewport, event, shape_index):
	if event.is_action_pressed("Click"):
		print("click entered")
		$"../../..".update_inventory(id)
