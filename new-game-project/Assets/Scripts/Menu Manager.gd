extends Control
@export var global = "res://Assets/Scripts/Global.gd"
#When buttons are clicked, do stuff
func _ready():
	preload("res://Assets/Scenes/arena.tscn")

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Assets/Scenes/arena.tscn")

func _on_settings_pressed():
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
