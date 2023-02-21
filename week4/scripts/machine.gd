class_name Machine extends Sprite

# Level of the machine
var level = 1
var upgradeCost = 100

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
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if is_pixel_opaque(get_local_mouse_position()):
			get_child(0).popup()
			
			print("A click!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	workOnJob(delta)
	chanceToBreakMachine()
	updateDurations()
	

func workOnJob(delta):
	"""
	Args:
		delta (float): The elapsed time since the previous frame, roughly 0.1667 seconds
	
	Every second, the machine works on the job. If the machine is broken, it will need to be 
	repaired, else it makes the item.
	"""

	elasped_time += delta
	
	if isJobFinished():
		if broken:
			fix_progress = 0
		else:
			item_progress = 0
		elasped_time = 0
	else:
		elasped_time += delta
		if elasped_time >= 1:
			if broken:
				fix_progress += fix_rate
			else:
				item_progress += item_rate
			elasped_time = 0
	

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
				 



