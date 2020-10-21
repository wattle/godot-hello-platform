extends KinematicBody2D

class_name actor

const FLOOR_NORMAL := Vector2.UP

export var speed := Vector2(300.0,1000.0)
export var gravity := 3000.0
var _velocity := Vector2.ZERO

# called 30-60 times a sec
func _physics_process(delta):
	_velocity.y += gravity * delta
	
