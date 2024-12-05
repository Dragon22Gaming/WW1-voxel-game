extends Label

func _process(delta):
	var fps = round(1/delta)
	print("fps: ", fps)
	self.text = "fps: " + str(fps)
