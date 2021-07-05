extends KinematicBody2D

export var moveSpeed := 300.0 setget moveSpeedSet, moveSpeedGet
export var gravity := 1000.0 setget gravitySet, gravityGet
export var jumpForce := 500.0 setget jumpForceSet, jumpForceGet

var moveInput := Vector2.ZERO
var velocity := Vector2.ZERO

func moveSpeedSet(value : float):
	moveSpeed =  max(value, 0)

func moveSpeedGet() -> float:
	return moveSpeed

func gravitySet(value : float):
	gravity = value

func gravityGet() -> float:
	return gravity

func jumpForceSet(value : float):
	jumpForce = value

func jumpForceGet() -> float:
	return jumpForce
	
func _process(delta):
		moveInput.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")

func _physics_process(delta):
	velocity.x = moveInput.x * moveSpeed
	if Input.is_action_just_pressed("jump") :
		jump()
	velocity.y += gravity * delta
	
	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP, true)

func jump():
	velocity.y = -jumpForce
