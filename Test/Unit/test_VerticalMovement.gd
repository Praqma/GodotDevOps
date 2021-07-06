extends 'res://addons/gut/test.gd'

var PlayerController = load("res://PlayerController.gd")

var gravity_update_values = [[1, 1, 100.0], [5,1,500.0], [1, 5, 500.0]]
func test_gravity_updates_properly(params = use_parameters(gravity_update_values)) :
	var controller = PlayerController.new()
	controller.gravity = 100.0
	
	simulate(controller, params[0], params[1])
	
	assert_eq(controller.velocity.y, params[2])
	
	controller.free()

var jump_update_values = [[10, .1, -100.0], [5,1,300.0], [1, 2, 0.0]]
func test_jump_velocity_updates_properly(params = use_parameters(jump_update_values)) :
	var controller = PlayerController.new()
	controller.gravity = 100.0
	controller.jumpForce = 200.0
	
	controller.jump();
	
	simulate(controller, params[0], params[1])
	
	assert_eq(controller.velocity.y, params[2])
	
	controller.free()
