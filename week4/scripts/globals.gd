"""
This file is used to declare global variables. 

To declare a global variable:
	var variable_name

To use this global variable in another script:
	global.variable_name

This file is auto-loaded, you don't have to do anything. You can check this out in 
Project > Project Setting > Autoload
"""

extends Node

# Player's balance
var COINS
var EMERALDS
var RUBY
var DIAMONDS

# Market Inventory
var NUM_OF_CHEST 
var NUM_OF_HELMET 
var NUM_OF_CLOAKS 
var NUM_OF_SWORDS 
var NUM_OF_CROSSBOWS 
var NUM_OF_POTIONS 

# Market Storage
var STORE

# Upgrade Machine Rates
var level1rate =  20
var level12upgradecost = 50
var level2rate = 15
var level23upgradecost = 50
var level3rate = 10
var level34upgradecost = 50
var level4rate = 5
