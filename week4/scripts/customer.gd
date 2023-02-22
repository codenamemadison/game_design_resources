class_name Customer extends Sprite

var frogType 



var neutralThreshold = 10
var angryThreshold = 20
var leaveThreshold = 30

var showFrogTime = 0
var didGenerateRNG = false
var wait_to_appear = 0

var inventory

# Called when the node enters the scene tree for the first time.
func _ready():
	inventory = load("res://scripts/inventory.gd").new()
	 # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global.DISABLE1 == true:
		get_node("../PopupPanel").hide()
		global.DISABLE1 = false
	
	if global.DONE1 == true:
		hideCustomer()
		global.DONE1 = false
		
	if global.customer1_finished:
		selectFrog()
		generateRandomItem()
		updateCustomerPopup()
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		if not didGenerateRNG:
			wait_to_appear = rng.randi_range(1, 15)
		didGenerateRNG = true
		if showFrogTime > wait_to_appear:
			showCustomer()
			global.customer1_finished = false
		showFrogTime += delta
	else:
		changeExpression(delta)
		showFrogTime = 0
		didGenerateRNG = false
	
	# Disable button if user dont got it
	var button = get_node("../PopupPanel/VBoxContainer/Button")
	if inventory.hasItem(global.customer1_requestedItem):
		button.disabled = false
	else:
		button.disabled = true
	

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(get_local_mouse_position()):
			get_node("../PopupPanel").show()
			
func changeExpression(delta):
	global.elaspedTime += delta
	var currentNode = get_node("../Customer1")
	if (global.elaspedTime <= neutralThreshold):
		pass
	elif (neutralThreshold <= global.elaspedTime) and (global.elaspedTime < angryThreshold):
		if frogType == "WIZARD":
			currentNode.texture = load("res://assets/Phrawgs/irritated frog wizard.png")
		else:
			currentNode.texture = load("res://assets/Phrawgs/irritated frog.png")
		global.customer1_requestedItemPrice = int(global.customer1_requestedItemPrice - (global.customer1_requestedItemPrice * 0.25))

	elif (angryThreshold <= global.elaspedTime) and (global.elaspedTime < leaveThreshold):
		if frogType == "WIZARD":
			currentNode.texture = load("res://assets/Phrawgs/mad frog wizard.png")
		else:
			currentNode.texture = load("res://assets/Phrawgs/mad frog.png")
		global.customer1_requestedItemPrice = int(global.customer1_requestedItemPrice - (global.customer1_requestedItemPrice * 0.5))
	else:
		hideCustomer()
		global.customer1_requestedItemPrice = 0
		global.elaspedTime = 0
		global.customer1_finished = true
				
	

func hideCustomer():
	get_node("../Customer1").hide()
	
func showCustomer():
	get_node("../Customer1").show()

func selectFrog():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var num = rng.randi()
	if num % 2 == 0:
		frogType = "WIZARD"
		self.texture = load("res://assets/Phrawgs/frog wizard.png")
	else:
		frogType = "OG"
		self.texture = load("res://assets/Phrawgs/frog.png")
		
func generateRandomItem():
	"""
	Randomly generate an item for the customer to purchase
	"""
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var items = global.STORE.keys()
	var selected_item = items[rng.randi_range(0, items.size()-1)]
	# Sets Item and its price
	var requestedItem = global.STORE[selected_item]
	match requestedItem["paymentType"]:
		"COINS":
			global.customer1_requestedItemPrice = rng.randi_range(1, 20)
		"EMERALDS":
			global.customer1_requestedItemPrice = rng.randi_range(1, 10)
		"RUBY":
			global.customer1_requestedItemPrice = rng.randi_range(1, 7)
		"DIAMOND":
			global.customer1_requestedItemPrice = rng.randi_range(1, 5)
	
	# Sets sprite accordingly 
	get_node("../PopupPanel/VBoxContainer/Sprite").texture = load(requestedItem["spritePath"])
	global.customer1_requestedItem = selected_item

func updateCustomerPopup():
	var itemName = global.STORE[global.customer1_requestedItem]["name"]
	var itemCost = str(global.customer1_requestedItemPrice)
	var itemSprite = global.STORE[global.customer1_requestedItem]["spritePath"]
	var currencySprite= global.STORE[global.customer1_requestedItem]["paymentPath"]
	
	get_node("../Customer1/RequestItemBubble/ReqItem").texture = load(itemSprite)
	get_node("../PopupPanel/VBoxContainer/HBoxContainer/ItemPrice").text = itemCost
	get_node("../PopupPanel/VBoxContainer/ItemName").text = itemName
	get_node("../PopupPanel/VBoxContainer/HBoxContainer/ItemSprite").texture = load(currencySprite)
	
