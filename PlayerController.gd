extends KinematicBody2D

export var airMoveSpeed := 100.0
export var groundMoveSpeed := 300.0
export var gravity := 1000.0 setget set_gravity, get_gravity
export var jumpForce := 600.0 setget set_jumpForce, get_jumpForce
export var snapLength := 5000.0
export var slopeSlideThreshold := 50.0
export var maxJumpCount := 2

var snap := false
var moveInput := Vector2.ZERO
var velocity := Vector2.ZERO
var moveSpeed := 300.0 setget set_moveSpeed, get_moveSpeed
var jumpCount := 1 setget set_jumpCount, get_jumpCount

func set_jumpCount(value : int):
	jumpCount = max(value, 0)

func get_jumpCount() -> int:
	return jumpCount

func set_moveSpeed(value : float):
	moveSpeed = max(value, 0)

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

func _ready():
	jumpCount = maxJumpCount

func _process(delta):
	moveInput.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	
	if Input.is_action_just_pressed("jump") and ((snap and is_on_floor()) or jumpCount > 0):
		jump()

func _physics_process(delta):
	calculate_velocity(delta)
	
	var snapVector = Vector2.DOWN * snapLength if snap else Vector2()
	velocity = move_and_slide_with_snap(velocity, snapVector, Vector2.UP, true, 4, deg2rad(slopeSlideThreshold))
	
	if is_on_floor() and (Input.is_action_just_released("move_right") or Input.is_action_just_released("move_left")):
		velocity.y = 0
	
	var just_landed := is_on_floor() and not snap
	if just_landed:
		snap = true

func jump():
	if jumpCount <= 0:
		return
	
	velocity.y = -jumpForce
	snap = false
	jumpCount -= 1

func calculate_velocity(delta : float):
	if is_on_floor():
		velocity.x = moveInput.x * moveSpeed
	elif is_on_wall():
		velocity.x = 0
	else:
		velocity.x += moveInput.x * airMoveSpeed
	velocity.x = clamp(velocity.x, -groundMoveSpeed, groundMoveSpeed)
	velocity.y += gravity * delta
