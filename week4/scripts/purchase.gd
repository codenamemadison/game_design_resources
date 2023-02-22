extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var market = load("res://scripts/market.gd").new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_Button_pressed():
	var paymentType = global.STORE[global.customer1_requestedItem]["paymentType"]
	market.giveItem(global.customer1_requestedItem, paymentType, global.customer1_requestedItemPrice) # Replace with function body.
	global.DONE1 = true
	global.DISABLE1 = true
	global.customer1_requestedItemPrice = 0
	global.elaspedTime = 0
	global.customer1_finished = true
	
