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
var COINS = 0
var EMERALDS = 0 
var RUBY = 0
var DIAMONDS = 0

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
var level2rate = 12
var level23upgradecost = 100
var level3rate = 7
var level34upgradecost = 150
var level4rate = 2
