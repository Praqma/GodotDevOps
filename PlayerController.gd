extends KinematicBody2D

export var moveSpeed := 300.0 setget set_moveSpeed, get_moveSpeed
export var gravity := 1000.0 setget set_gravity, get_gravity
export var jumpForce := 600.0 setget set_jumpForce, get_jumpForce

var airMoveSpeed := 100.0
var groundMoveSpeed := 300.0

var snap := false
var moveInput := Vector2.ZERO
var velocity := Vector2.ZERO

func set_moveSpeed(value : float):
	moveSpeed =  max(value, 0)

func get_moveSpeed() -> float:
	return moveSpeed

func set_gravity(value : float):
	gravity = value

func get_gravity() -> float:
	return gravity

func set_jumpForce(value : float):
	jumpForce = value

func get_jumpForce() -> float:
	return jumpForce
	
func _process(delta):
		moveInput.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")

func _physics_process(delta):
	velocity.x = moveInput.x * moveSpeed
	if Input.is_action_just_pressed("jump") and snap:
		jump()
	velocity.y += gravity * delta
	
	var snapVector = Vector2.DOWN * 50 if snap else Vector2()
	velocity = move_and_slide_with_snap(velocity, snapVector, Vector2.UP, true)
	
	var just_landed := is_on_floor() and not snap
	if just_landed:
		snap = true
		moveSpeed = groundMoveSpeed

func jump():
	velocity.y = -jumpForce
	snap = false
	moveSpeed = airMoveSpeed
