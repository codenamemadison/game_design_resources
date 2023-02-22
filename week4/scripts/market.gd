# Naming class
class_name Market extends Node

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
	
	var file = File.new()
	file.open("res://assets/prices.json", file.READ)
	global.STORE = parse_json(file.get_as_text())
	file.close()
	

#func purchaseItem(item_id):
#	"""
#	Customer buys an item from the store
#	"""
#
#	match item_id:
#		"CHEST":
#			global.NUM_OF_CHEST += 1
#		"HELMET":
#			global.NUM_OF_HELMET += 1
#		"CLOAK":
#			global.NUM_OF_CLOAKS += 1
#		"SWORD":
#			global.NUM_OF_SWORDS += 1
#		"CROSSBOW":
#			global.NUM_OF_CROSSBOWS += 1
#		"POTION":
#			global.NUM_OF_POTIONS += 1
