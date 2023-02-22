class_name Customer extends Node

var frogType 

var requestedItem
var requestedItemPrice

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func hideCustomer():
	get_node("../Customer1").hide()
	
func showCustomer():
	get_node("../Customer1").show()

func selectFrog():
	var rng = RandomNumberGenerator.new()
	if rng.randi() % 2 == 0:
		frogType = "WIZARD"
		get_node("../Customer1").set_texture = 
	else:
		frogType = "OG"
	
		

func generateRandomItem():
	"""
	Randomly generate an item for the customer to purchase
	"""
	var rng = RandomNumberGenerator.new()
	var items = global.STORE.keys()
	
	# Sets Item and its price
	requestedItem = global.STORE[items[rng.randi(0, items.size())]]
	match requestedItem["paymentType"]:
		"COINS":
			requestedItemPrice = rng.randi(1, 20)
		"EMERALDS":
			requestedItemPrice = rng.randi(1, 10)
		"RUBY":
			requestedItemPrice = rng.randi(1, 7)
		"DIAMOND":
			requestedItemPrice = rng.randi(1, 5)
	
	# Sets sprite accordingly 
	get_node("AskForItem/RequestedItem").set_texture = requestedItem["spritePath"]
		
