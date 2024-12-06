extends Node

var current_weapon = null

var weapon_stack = [] #array of currently implemented guns :D

var weapon_indicator = 0

@export var _weapon_resources: Array[Weapon_Resource]
@export var _start_weapons: Array[String]
