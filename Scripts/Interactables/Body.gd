extends KinematicBody2D
class_name Body

export var gravity := 500
export var speedReduction := 0.05

var velocity := Vector2.ZERO

func _process(delta):
	velocity.y += gravity * delta
	velocity.x = lerp(velocity.x, 0, speedReduction)

func _physics_process(delta):
	velocity = move_and_slide(velocity, Vector2.UP)
