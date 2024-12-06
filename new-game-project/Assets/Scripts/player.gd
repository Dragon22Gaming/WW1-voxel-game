extends CharacterBody3D

@export var look_sensitivity: float = 0.0040
@export var jump_velocity: float = 6.0
@export var auto_bhop: bool = true
@export var walk_speed: float = 7.0
@export var sprint_speed: float = 8.5

var wish_dir: Vector3 = Vector3.ZERO

func _ready():
	for child in %WorldModel.find_children("*", "VisualInstance3D"):
		child.set_layer_mask_value(1, false)
		child.set_layer_mask_value(2, true)

func _unhandled_input(event):
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			rotate_y(-event.relative.x * look_sensitivity)
			%Camera3D.rotate_x(-event.relative.y * look_sensitivity)
			%Camera3D.rotation.x = clamp(%Camera3D.rotation.x, deg_to_rad(-90), deg_to_rad(90))

func _process(_delta):
	pass

func _handle_air_physics(delta) -> void:
	velocity.y = ProjectSettings.get_setting("physics/3d/default_gravity") * delta

func _handle_ground_physics(_delta) -> void:
	self.velocity.x = wish_dir.x * walk_speed
	self.velocity.z = wish_dir.z * walk_speed

func _physics_process(delta):
	var input_dir = Input.get_vector("Left","Right","Up","Down").normalized()
	#depending on the players direction, negate or do not negate the movement commands
	wish_dir = self.global_transform.basis * Vector3(input_dir.x, 0., input_dir.y)
	
	if is_on_floor():
		_handle_ground_physics(delta)
	else:
		_handle_air_physics(delta)