extends KinematicBody2D

export var gravity := 500

var velocity := Vector2.ZERO

func _process(delta):
	velocity.y += gravity * delta

func _physics_process(delta):
	velocity = move_and_slide(velocity, Vector2.UP)
