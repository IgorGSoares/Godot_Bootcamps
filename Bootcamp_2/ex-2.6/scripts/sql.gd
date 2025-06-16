extends Node2D

var database: SQLite

func _ready():
	database = SQLite.new()
	database.path = "res://data.db"
	database.open_db()
	#create_table()


func _process(delta):
	pass

func create_table():
	var table = {
		"id": {"data_type":"string", "primary_key": true, "not_null":true, "auto_increment":true},
		"score": {"data_type":"int"}
	}
	database.create_table("players", table)
	pass

func insert_data(new_data):
	for x in new_data:
		var data = {
			"score": new_data[x]
		}
		database.insert_row("players", data)
	pass

func load_data() -> Array:
	var data = [
		0,
		0,
		0,
		0,
		0
	]
	
	for x in 5:
		data[x] = database.select_rows("players", "id == " + str(x+1), ["score"])
	#print(data)
	#print(data[0])
	return data

func test():
	var score = {
		"first": 0,
		"second": 0,
		"third": 0,
		"forth": 0,
		"fifth": 0,
	}
	
	pass
