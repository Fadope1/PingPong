extends KinematicBody2D

enum _input_type {
	ws, 
	keys
}
export(_input_type) var input_type
export var SPEED = 10_000

var another_dict = {
	"ws": {'up': KEY_W, 'down': KEY_S},
	"keys": {'up': KEY_UP, 'down': KEY_DOWN}
}

func _ready():
	pass

func _physics_process(delta):
	var motion := Vector2.ZERO
	
	var input = another_dict[_input_type.keys()[input_type]]
	if Input.is_key_pressed(input['up']):
		motion.y -= 1
	if Input.is_key_pressed(input['down']):
		motion.y += 1
	
	motion = motion.normalized()
	motion = move_and_slide(motion * SPEED * delta)
