extends KinematicBody2D

export var airMoveSpeed := 100.0
export var groundMoveSpeed := 300.0
export var gravity := 1000.0 setget set_gravity, get_gravity
export var jumpForce := 600.0 setget set_jumpForce, get_jumpForce
export var snapLength := 5000.0
export var slopeSlideThreshold := 50.0
export var maxJumpCount := 2
export var maxDashCount := 2
export var dashLength := 0.2
export var dashSpeed := 1000
export var deathBarrier := 200

var snap := false
var moveInput := Vector2.ZERO
var velocity := Vector2.ZERO
var moveSpeed := 300.0 setget set_moveSpeed, get_moveSpeed
var jumpCount := 1 setget set_jumpCount, get_jumpCount
var dashCount
var isDashing = false
var dashDirection
var facingDir := Vector2.ZERO

onready var animatedSprite := $AnimatedSprite
onready var _transition_rect := $"../CanvasLayer/SceneTransitionRect"

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

func dash_timer_timeout():
	velocity = Vector2.ZERO
	isDashing = false

func ghostTrail_timer_timeout():
#	if isDashing:
		var ghost = preload("res://Scenes/GhostTrail.tscn").instance()
		get_parent().add_child(ghost)
		ghost.position = position
		ghost.texture = animatedSprite.frames.get_frame(animatedSprite.animation, animatedSprite.frame)
		ghost.flip_h = animatedSprite.flip_h

func _ready():
	setupValues()
	$dash_timer.connect("timeout", self, "dash_timer_timeout")
	
func setupValues():
	jumpCount = maxJumpCount
	dashCount = maxDashCount

func _process(delta):
	if position.y > deathBarrier:
		die()
		return
	
	moveInput.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	moveInput.y =  Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	if moveInput.x != 0:
		facingDir = moveInput
		facingDir.y = 0
		facingDir = facingDir.normalized()
	
	if Input.is_action_just_pressed("jump") and ((snap and is_on_floor()) or jumpCount > 0):
		jump()
	if Input.is_action_just_pressed("dash") and dashCount > 0 and not isDashing:	
		$dash_timer.start(dashLength)
		dash()
		$Ghost.emitting = true
	
	handle_animation()

func _physics_process(delta):
	if not isDashing :
		calculate_velocity(delta)
	
#	if is_on_floor() or is_on_wall() or is_on_ceiling():
#		isDashing = false

	if(isDashing):
		velocity = move_and_slide(dashDirection, Vector2.UP)
	else:
		var snapVector = Vector2.DOWN * snapLength if snap else Vector2()
		velocity = move_and_slide_with_snap(velocity, snapVector, Vector2.UP, true, 4, deg2rad(slopeSlideThreshold))
	
	if is_on_floor() and (Input.is_action_just_released("move_right") or Input.is_action_just_released("move_left")):
		velocity.y = 0
	
	var just_landed := is_on_floor() and not snap
	if just_landed:
		land()

func jump():
	if jumpCount <= 0:
		return
	
#	if !is_on_floor():
#		jumpCount -= 1
	
	velocity.y = -jumpForce
	snap = false
	jumpCount -= 1

func dash():
	if dashCount <= 0:
		return
	isDashing = true
	
	if moveInput.length() < 0.1:
		dashDirection = facingDir * dashSpeed
	else:
		dashDirection = moveInput * dashSpeed
	snap = false
	dashCount -= 1

func land():
	snap = true
	jumpCount = maxJumpCount
	dashCount = maxDashCount
	isDashing = false

func calculate_velocity(delta : float):
	if is_on_floor():
		velocity.x = moveInput.x * moveSpeed
	elif is_on_wall():
		velocity.x = 0
	else:
		velocity.x += moveInput.x * airMoveSpeed
	velocity.x = clamp(velocity.x, -groundMoveSpeed, groundMoveSpeed)
	velocity.y += gravity * delta

func die() -> void:
	if not _transition_rect.isTransitioning:
		get_tree().reload_current_scene()

func handle_animation():
	if facingDir.x > 0:
		animatedSprite.flip_h = false
	if facingDir.x < 0:
		animatedSprite.flip_h = true
	
	if velocity == Vector2.ZERO and is_on_floor():
		animatedSprite.animation = "Idle"
		return
	if velocity != Vector2.ZERO and is_on_floor() and !isDashing:
		animatedSprite.animation = "Running"
		return
	if isDashing:
		animatedSprite.animation = "Dashing"
		return
	if !isDashing and !is_on_floor() and velocity.y >= 0:
		animatedSprite.animation = "Falling"
		return
	if !isDashing and !snap and velocity.y < 0:
		animatedSprite.animation = "Jumping"
		return
