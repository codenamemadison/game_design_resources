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
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(get_local_mouse_position()):
			if event.pressed:
				print("A click!")
				get_node("/root/Main/build pop up/").hide()
			else:
				print('else')
