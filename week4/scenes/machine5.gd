extends Sprite

# Level of the machine
var level = 1
var upgradeCost = 100

# important info
var itemCost = 5
var machine_process = "Stationary"
var itemNum = 0

# When machine is not broken
var item_progress = 0
var item_rate = 10
var item_goal = 100

# Machine is broken
var fix_progress = 0
var fix_rate = 10
var fix_goal = 100

var broken = false
var chance_to_break = 5.0

# ----------------

var elasped_time = 0
var duration_to_complete_item = 0
var duration_to_complete_fixing = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	$"fix5".visible = false
	$"machine status5".texture = null
	$"inventory5/inv num5".text = "0"
	$ProgressBar5.value = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if machine_process == "build":
		workOnJob(delta)
	#workOnJob(delta)
	#chanceToBreakMachine()
	#updateDurations()
	






func workOnJob(delta):
	"""
	Args:
		delta (float): The elapsed time since the previous frame, roughly 0.1667 seconds
	
	Every second, the machine works on the job. If the machine is broken, it will need to be 
	repaired, else it makes the item.
	"""

	elasped_time += delta
	
	if broken:
		pass
	else:
		$"machine status5".texture = load("res://assets/machine status icons/machine_building.png")
		
	if isJobFinished():
		if broken:
			fix_progress = 0
		else:
			item_progress = 0
			itemNum += 1
			$"inventory5/inv num5".text = str(itemNum)
			machine_process = "Stationary"
			$"machine status5".texture = null
		elasped_time = 0
	else:
		elasped_time += delta
		if elasped_time >= 1:
			if broken:
				fix_progress += fix_rate
			else:
				item_progress += item_rate
			elasped_time = 0
	$ProgressBar5.value = item_progress

func isJobFinished():
	"""
	Returns a boolean if worker is finished with the job
	"""
	return (fix_progress >= fix_goal if broken else item_progress >= item_goal)
	
func chanceToBreakMachine():
	"""
	RNG to break the machine
	"""
	if not broken:
		var rng = RandomNumberGenerator.new()
		if rng.randf_range(0.0, 100.0) <= chance_to_break:
			broken = true

func updateDurations():
	"""
	Updates duration to complete job
	"""
	duration_to_complete_item = item_rate / item_goal
	duration_to_complete_fixing = fix_rate / fix_goal

func upgrade():
	"""
	Upgrades machine to run faster
	
	Returns:
		None
	"""
	if not broken:
		if level != global.MAX_MACHINE_LEVEL:
			# Disable UI from upgrading 
			pass 
		else:
			if global.BALANCE < upgradeCost:
				pass 
			else:
				level += 1
				upgradeCost *= level 
				global.BALANCE -= upgradeCost
				 
func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and get_node("/root/Main/machines/").BUILD_POP_UP_OPEN == false:
		if get_rect().has_point(get_local_mouse_position()):
			if event.pressed:
				print("A click!")
				get_node("/root/Main/machines/").BUILD_POP_UP_OPEN = true
				get_node("/root/Main/build pop up/").popup()
				get_node("/root/Main/build pop up/pop up content/item name/").set_text("Mystery Potion")
				get_node("/root/Main/build pop up/pop up content/item sprite/").texture = load("res://assets/fantasy icons - cropped/tile146.png")
				get_node("/root/Main/build pop up/pop up content/pop up text/cost text/cost num/").set_text(str(itemCost))
				get_node("/root/Main/build pop up/pop up content/pop up text/cost text/cost type/").texture = load("res://assets/money and gems - cropped/tile004.png")
			else:
				print('else')


