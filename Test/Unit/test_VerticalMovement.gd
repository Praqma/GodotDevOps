extends 'res://addons/gut/test.gd'

var PlayerController = load("res://Scripts/Player/PlayerController.gd")
var controller

func before_each():
	controller = PlayerController.new()

func after_each():
	controller.free()

var expected_jump_values = [[1.0, -100.0], [5.0, 300.0], [2.0, 0.0]]
func test_jump_velocity_updates_properly(params = use_parameters(expected_jump_values)) :
	controller.gravity = 100.0
	controller.jumpForce = 200.0
	
	controller.jump();
	controller.calculate_velocity(params[0])
	
	assert_eq(controller.velocity.y, params[1])

var expected_gravity_values = [[1.0, 100.0], [5.0, 500.0]]
func test_calculate_vertical_velocity_with_gravity(params = use_parameters(expected_gravity_values)):
	controller.gravity = 100.0
	
	controller.calculate_velocity(params[0])
	
	assert_eq(controller.velocity.y, params[1])

var jump_values = [[3, 2], [0, 0]]
func test_jumping_decreases_jump_count_properly(params = use_parameters(jump_values)):
	controller.maxJumpCount = params[0]
	controller.setupValues()
	
	controller.jump()
	
	assert_eq(controller.jumpCount, params[1])

func test_landing_resets_jump_count():
	controller.maxJumpCount = 3
	controller.jumpCount = 0
	
	controller.land()
	
	assert_eq(controller.jumpCount, controller.maxJumpCount)
