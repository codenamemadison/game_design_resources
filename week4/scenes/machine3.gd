extends Sprite

# Level of the machine
var level = 1
var upgradeCost = 100

# important info
var itemCost = 10
var machine_process = "Stationary"
var itemNum = 0

# When machine is not broken
var item_progress = 0
var item_rate = 10
var item_goal = 100
var changeCurrency = false

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
	get_node("/root/Main/machines/top row/fix3/").visible = false
	$"machine status3".texture = null
	$"inventory3/inv num3".text = "0"
	$ProgressBar3.value = 0
	level = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var newBalance = global.RUBY - itemCost
	
	if machine_process == "build" and newBalance >= 0:
		#get_node('/root/Main/build pop up/pop up content/pop up text/warning').visible = false
		if changeCurrency:
			global.RUBY -= itemCost
			get_node("/root/Main/currencies/currency stats/ruby stats/").text = str(global.RUBY)
			changeCurrency= false
		workOnJob(delta)
	elif machine_process == "build":
		#get_node('/root/Main/build pop up/pop up content/pop up text/warning').visible = true
		machine_process = "Stationary"
		$"machine status3".texture = null
		elasped_time = 0
	updateLevelStats(delta)
	#workOnJob(delta)
	#chanceToBreakMachine()
	#updateDurations()
	


func updateLevelStats(delta):
	"""
	Args:
		delta (float): The elapsed time since the previous frame, roughly 0.1667 seconds
	
	Every second, the machine level is checked and the item_progress and item_rate stats are updated
	accordingly.
	"""
	if level == 1:
		item_rate = global.level1rate
	elif level == 2:
		item_rate = global.level2rate
	elif level == 3:
		item_rate = global.level3rate
	elif level == 4:
		item_rate = global.level4rate



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
		$"machine status3".texture = load("res://assets/machine status icons/machine_building.png")
		
	if isJobFinished():
		item_progress = 0
		itemNum += 1
		# update inventory stats
		$"inventory3/inv num3".text = str(itemNum)
		global.NUM_OF_SWORDS = itemNum
		
		machine_process = "Stationary"
		$"machine status3".texture = null
		elasped_time = 0
	else:
		elasped_time += delta
		if elasped_time >= 1:
			item_progress += item_rate
			elasped_time = 0
	$ProgressBar3.value = item_progress

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
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and get_node("/root/Main/machines/").BUILD_POP_UP_OPEN == false and get_node("/root/Main/machines/").UPGRADE_POP_UP_OPEN == false:
		if get_rect().has_point(get_local_mouse_position()):
			if event.pressed:
				print("A click!")
				get_node("/root/Main/machines/").BUILD_POP_UP_OPEN = true
				get_node("/root/Main/build pop up/").popup()
				get_node("/root/Main/build pop up/pop up content/item name/").set_text("Classic Sword")
				get_node("/root/Main/build pop up/pop up content/item sprite/").texture = load("res://assets/fantasy icons - cropped/tile081.png")
				get_node("/root/Main/build pop up/pop up content/pop up text/cost text/cost num/").set_text(str(itemCost))
				get_node("/root/Main/build pop up/pop up content/pop up text/cost text/cost type/").texture = load("res://assets/money and gems - cropped/tile001.png")
				get_node("/root/Main/build pop up/pop up content/pop up text/level/").set_text("Machine Level "+str(level))
			else:
				print('else')



