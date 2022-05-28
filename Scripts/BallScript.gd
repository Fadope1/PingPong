extends KinematicBody2D

# Global vars
export var SPEED := 200

var motion := Vector2(1, -1)

func _physics_process(delta):
	var collide = move_and_collide(motion * SPEED * delta)
	
	if collide: # inverse motion Vector
		motion = motion.bounce(collide.normal)
		# motion.reflect
	
