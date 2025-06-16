extends Node2D


@onready var inventory = {
	"Sword": 1,
	"Potion": 3,
	"Boots": 2
}

@onready var items = {
	"1": $CanvasLayer/GridContainer/Area2D,
	"2": $CanvasLayer/GridContainer/Area2D2,
	"3": $CanvasLayer/GridContainer/Area2D3
}

func _ready():
	_update_items()
	

func update_inventory(id):
	match id:
		0:
			if(inventory["Sword"] > 0): inventory["Sword"] -=1
		1:
			if(inventory["Potion"] > 0): inventory["Potion"] -=1
		2:
			if(inventory["Boots"] > 0): inventory["Boots"] -=1
	
	_update_items()
	

func _update_items():
	var array = []
	for x in inventory:
		#print(int(x))
		array.append(inventory[x])
	
	print(array)
	
	for x in items:
		items[x].update_item(array[int(x)-1])
