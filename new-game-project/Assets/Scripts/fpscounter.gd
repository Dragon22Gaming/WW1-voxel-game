extends Label

func _process(delta):
	var fps = round(1/delta)
	self.text = "fps: " + str(fps)
