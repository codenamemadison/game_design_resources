extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and get_node("/root/Main/machines/").BUILD_POP_UP_OPEN == false and get_node("/root/Main/machines/").UPGRADE_POP_UP_OPEN == false:
		if get_rect().has_point(get_local_mouse_position()):
			if event.pressed:
				var machinelvl = get_node("/root/Main/machines/top row/machine1/").level
				if  machinelvl <= 3:
					get_node("/root/Main/machines/").UPGRADE_POP_UP_OPEN = true
					get_node("/root/Main/upgrade pop up/").popup()
					#get_node("/root/Main/upgrade pop up/pop up content/pop up text/prompt/").set_text("Upgrade machine to Level "+str(machinelvl)+"?")
					#get_node("/root/Main/upgrade pop up/pop up content/pop up text/rate info/current rate/").set_text()
					#get_node("/root/Main/upgrade pop up/pop up content/pop up text/rate info/new rate/").set_text()
					#get_node("/root/Main/build pop up/pop up content/item sprite/").texture = load("res://assets/fantasy icons - cropped/tile113.png")
					#get_node("/root/Main/build pop up/pop up content/pop up text/cost text/cost num/").set_text(str(itemCost))
					#get_node("/root/Main/build pop up/pop up content/pop up text/cost text/cost type/").texture = load("res://assets/money and gems - cropped/tile000.png")
					#get_node("/root/Main/build pop up/pop up content/pop up text/level/").set_text("Machine Level "+str(level))
					#get_node("/root/Main/machines/top row/machine1/").level += 1
				else:
					pass
			
				print("A click on upgrade!")
			else:
				print('else')
