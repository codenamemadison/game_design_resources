# Naming class
class_name Market extends Node

# Member Variables
var store = {}


# Called when the node enters the scene tree for the first time.
func _ready():
	load_json_file()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func load_json_file():
	"""
	Populates the store with items from JSON file
	"""
	
	var file = File.new()
	file.open("res://assets/prices.json", file.READ)
	store = parse_json(file.get_as_text())
	file.close()
	

func purchase_item(category, item):
	"""
	Customer buys an item from the store
	"""
	
	global.BALANCE += store[category][item]
