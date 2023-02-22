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
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and get_node("/root/Main/machines/").BUILD_POP_UP_OPEN == false:
		if get_rect().has_point(get_local_mouse_position()):
			if event.pressed:
				if get_node("/root/Main/machines/bottom row/machine5/").level <= 3:
					get_node("/root/Main/machines/bottom row/machine5/").level += 1
				else:
					pass # TODO: display message saying you are at max level
				print("A click on upgrade!")
			else:
				print('else')
