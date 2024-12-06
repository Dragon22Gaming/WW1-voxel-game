extends Node

@export var Is_Dev: bool = false

func _ready():
	if Is_Dev:
		ProjectSettings.set_setting("display/window/size/always_on_top", true)
		ProjectSettings.set_setting("display/window/size/borderless", false)
	else:
		ProjectSettings.set_setting("display/window/size/always_on_top", false)
		ProjectSettings.set_setting("display/window/size/borderless", false)
		ProjectSettings.set_setting("display/window/size/mode", "Fullscreen")

func _process(_delta):
	pass
