extends VBoxContainer
var BUILD_POP_UP_OPEN = false





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
	elif itemTypeToBuild == "Chest Armor":
		$"top row/machine2/".machine_process = "build"
	elif itemTypeToBuild == "Classic Sword":
		$"top row/machine3/".machine_process = "build"
	elif itemTypeToBuild == "Magic Cloak":
		$"bottom row/machine4/".machine_process = "build"
	elif itemTypeToBuild == "Mystery Potion":
		$"bottom row/machine5/".machine_process = "build"
	elif itemTypeToBuild == "Wooden Crossbow":
		$"bottom row/machine6/".machine_process = "build"
	get_node("/root/Main/build pop up/").hide()
	get_node("/root/Main/machines/").BUILD_POP_UP_OPEN = false
