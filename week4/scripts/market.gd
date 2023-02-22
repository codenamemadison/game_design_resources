# Naming class
class_name Market extends Node

var inventory = load("res://scripts/inventory.gd").new()

# Called when the node enters the scene tree for the first time.
func _ready():
	initVars()
	loadJsonFile()

func initVars():
	"""
	Initializes currency variables 
	"""
	global.COINS = 0
	global.EMERALDS = 0
	global.RUBY = 0
	global.DIAMONDS = 0

func loadJsonFile():
	"""
	Populates the store with items from JSON file
	"""
	print("Hello")
	var file = File.new()
	file.open("res://assets/items.json", file.READ)
	global.STORE = parse_json(file.get_as_text())
	file.close()
	
func deposit(currency, amount):
	match currency:
		"COINS":
			global.COINS += amount
		"EMERALD": 
			global.EMERALDS += amount
		"RUBY":
			global.RUBY += amount
		"DIAMOND":
			global.DIAMONDS += amount
			
func giveItem(item_id, currency, amount):
	print(currency)
	inventory.removeItem(item_id)
	deposit(currency, amount)


	
	
