extends VBoxContainer
var BUILD_POP_UP_OPEN = false
var UPGRADE_POP_UP_OPEN = false




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_build_pop_up_popup_hide():
	BUILD_POP_UP_OPEN = false


func _on_Build_pressed():
	var itemTypeToBuild = get_node("/root/Main/build pop up/pop up content/item name/").text
	print(itemTypeToBuild)
	if itemTypeToBuild == "Helmet Armor":
		$"top row/machine1/".machine_process = "build"
		$"top row/machine1/".changeCurrency = true
	elif itemTypeToBuild == "Chest Armor":
		$"top row/machine2/".machine_process = "build"
		$"top row/machine2/".changeCurrency = true
	elif itemTypeToBuild == "Classic Sword":
		$"top row/machine3/".machine_process = "build"
		$"top row/machine3/".changeCurrency = true
	elif itemTypeToBuild == "Magic Cloak":
		$"bottom row/machine4/".machine_process = "build"
		$"bottom row/machine4/".changeCurrency = true
	elif itemTypeToBuild == "Mystery Potion":
		$"bottom row/machine5/".machine_process = "build"
		$"bottom row/machine5/".changeCurrency = true
	elif itemTypeToBuild == "Wooden Crossbow":
		$"bottom row/machine6/".machine_process = "build"
		$"bottom row/machine6/".changeCurrency = true
	get_node("/root/Main/build pop up/").hide()
	get_node("/root/Main/machines/").BUILD_POP_UP_OPEN = false


func _on_upgrade_pressed():
	var itemTypeToBuild = get_node("/root/Main/upgrade pop up/pop up content/item name/").text
	print(itemTypeToBuild)
	if itemTypeToBuild == "Helmet Armor":
		$"top row/machine1/".level += 1
	elif itemTypeToBuild == "Chest Armor":
		$"top row/machine2/".level += 1
	elif itemTypeToBuild == "Classic Sword":
		$"top row/machine3/".level += 1
	elif itemTypeToBuild == "Magic Cloak":
		$"bottom row/machine4/".level += 1
	elif itemTypeToBuild == "Mystery Potion":
		$"bottom row/machine5/".level += 1
	elif itemTypeToBuild == "Wooden Crossbow":
		$"bottom row/machine6/".level += 1
	get_node("/root/Main/upgrade pop up/").hide()
	get_node("/root/Main/machines/").UPGRADE_POP_UP_OPEN = false


func _on_upgrade_pop_up_popup_hide():
	UPGRADE_POP_UP_OPEN = false
