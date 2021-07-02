extends KinematicBody2D

export var moveSpeed := 300.0 setget moveSpeedSet, moveSpeedGet
var moveInput := Vector2.ZERO

func moveSpeedSet(value : float):
	moveSpeed =  max(value, 0)

func moveSpeedGet() -> float:
	return moveSpeed

func _process(delta):
		moveInput.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")

func _physics_process(delta):
	var velocity := Vector2(moveInput * moveSpeed)
	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP, true)
