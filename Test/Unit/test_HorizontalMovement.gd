extends 'res://addons/gut/test.gd'

var PlayerController = load("res://PlayerController.gd")

var move_speed_constructor_values = [[10.0], [-10.0]]
func test_constructor_setting_move_speed_properly(params = use_parameters(move_speed_constructor_values)):
	var controller = PlayerController.new(params[0])

	assert_between(controller.moveSpeed, 0.0, INF)

	controller.free()

func test_setter_func_setting_move_speed_properly():
	var controller = PlayerController.new(10.0)
	controller.moveSpeed = -10.0
	
	assert_between(controller.moveSpeed, 0.0, INF)
	
	controller.free()
