extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

		
func _on_Timer_timeout():
	$EmeraldProgress.value+=1
	if $EmeraldProgress.value == 100:
		$EmeraldProgress.value = 0
		global.EMERALDS+=1
	$"currencies ui/currency stats/emeraldstats".text = str(global.EMERALDS)
	
func _on_Timer2_timeout():
	$RubyProgress.value+=1
	if $RubyProgress.value == 100:
		$RubyProgress.value = 0
		global.RUBY+=1
	$"currencies ui/currency stats/rubystats".text = str(global.RUBY)
	
func _on_Timer3_timeout():
	$DiamondProgress.value+=1
	if $DiamondProgress.value == 100:
		$DiamondProgress.value = 0
		global.DIAMONDS+=1
	$"currencies ui/currency stats/diamondstats".text = str(global.DIAMONDS)
