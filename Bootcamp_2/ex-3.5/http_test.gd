extends Node

enum call {NAME, COORD, NONE}

var result: String
var cur_call = call.NONE

func _ready():
	$HTTPRequest.request_completed.connect(_on_request_completed)
	#$HTTPRequest.request("https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&hourly=temperature_2m") #TEST API
	#$HTTPRequest.request("https://geocoding-api.open-meteo.com/v1/search?name=Berlin&count=1&language=en") #TEST API GEOCODING


func search_city(name:String):
	cur_call = call.NAME
	print("searching")
	$HTTPRequest.request("https://geocoding-api.open-meteo.com/v1/search?name=" + name + "&count=1&language=en")


func search_coord(lat:String, long:String):#lat:String, long:String
	cur_call = call.COORD
	print("searching")
	$HTTPRequest.request("https://api.open-meteo.com/v1/forecast?latitude="+lat+"&longitude="+long+"&current=temperature_2m,is_day")
	#$HTTPRequest.request("https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.419&current=temperature_2m,is_day")
	pass


func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	
	print(json) #TEST API RETURNS
	#print(json["elevation"]) #TEST API RETURNS SINGLE
	
	if cur_call == call.NAME:
		#print(json["results"][0]["country"])#TEST API RETURNS IN DICTIONARY ARRAY
		result = "latitude: " + str(json["results"][0]["latitude"]) + ", longitude: " + str(json["results"][0]["longitude"])
	if cur_call == call.COORD:
		result = "time: " + str(json["current"]["time"]) + ", temperature: " + str(json["current"]["temperature_2m"])
	$"../GAME/CanvasLayer/Result".text = result
		
