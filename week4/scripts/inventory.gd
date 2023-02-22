class_name InventoryManager extends Node

var market = load("res://scripts/market.gd").new()

# Called when the node enters the scene tree for the first time.
func _ready():
	initVars()

# Called every frame
func _process(_delta):
	updateCurrencyUI()
	updateMachineUI()
	
func initVars():
	"""
	Initializes inventory variables 
	"""
	global.NUM_OF_CHEST = 0
	global.NUM_OF_HELMET = 0
	global.NUM_OF_CLOAKS = 0
	global.NUM_OF_SWORDS = 0
	global.NUM_OF_CROSSBOWS = 0
	global.NUM_OF_POTIONS = 0

func updateCurrencyUI():
	"""
	Updates the player's money onto screen
	"""
	
	var currency = [global.COINS, global.EMERALDS, global.RUBY, global.DIAMONDS]
	
	# Gets children under currency stats
	var children = get_children()[0].get_children()
	for i in children.size():
		children[i].text = str(currency[i])
		
func updateMachineUI():
	"""
	Updates each machine's UI to display their respective number of items
	"""
	var items = [global.NUM_OF_HELMET, global.NUM_OF_CHEST, global.NUM_OF_SWORDS, global.NUM_OF_CLOAKS, global.NUM_OF_POTIONS, global.NUM_OF_CROSSBOWS]
	var path = "../machines/%s/machine%s/inventory%s/inv num%s"
	for i in range(6):
		if i < 3:
			get_node(path % ["top row", i+1, i+1, i+1]).text = str(items[i])
		else:
			get_node(path % ["bottom row", i+1, i+1, i+1]).text = str(items[i])


func hasItem(item_id):
	"""
	Checks if the item is in stock
	
	Args:
		item_id: An identifer for item we are selling (check prices.json for ids)
	Return:
		bool: True if there is atleast 1 item else False
	"""
	
	match item_id:
		"CHEST":
			return global.NUM_OF_CHEST != 0
		"HELMET":
			return global.NUM_OF_HELMET != 0
		"CLOAK":
			return global.NUM_OF_CLOAKS != 0
		"SWORD":
			return global.NUM_OF_SWORDS != 0
		"CROSSBOW":
			return global.NUM_OF_CROSSBOWS != 0
		"POTION":
			return global.NUM_OF_POTIONS != 0

func addItem(item_id):
	"""
	Adds an item to inventory
	
	Args:
		item_id: An identifer for a item we are selling (check prices.json for ids)
	"""
	
	match item_id:
		"CHEST":
			global.NUM_OF_CHEST += 1
		"HELMET":
			global.NUM_OF_HELMET += 1
		"CLOAK":
			global.NUM_OF_CLOAKS += 1
		"SWORD":
			global.NUM_OF_SWORDS += 1
		"CROSSBOW":
			global.NUM_OF_CROSSBOWS += 1
		"POTION":
			global.NUM_OF_POTIONS += 1

func removeItem(item_id):
	"""
	Removes an item to inventory
	
	Args:
		item_id: An identifer for a item we are selling (check prices.json for ids)
	"""
	
	match item_id:
		"CHEST":
			global.NUM_OF_CHEST -= 1
		"HELMET":
			global.NUM_OF_HELMET -= 1
		"CLOAK":
			global.NUM_OF_CLOAKS -= 1
		"SWORD":
			global.NUM_OF_SWORDS -= 1
		"CROSSBOW":
			global.NUM_OF_CROSSBOWS -= 1
		"POTION":
			global.NUM_OF_POTIONS -= 1
