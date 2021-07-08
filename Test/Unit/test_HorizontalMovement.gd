extends 'res://addons/gut/test.gd'

var PlayerController = load("res://Scripts/Player/PlayerController.gd")

var move_speed_setter_values = [[10.0], [-10.0]]
func test_setter_func_setting_move_speed_properly(params = use_parameters(move_speed_setter_values)):
	var controller = PlayerController.new()
	controller.moveSpeed = params[0]
	
	assert_between(controller.moveSpeed, 0.0, INF)
	
	controller.free()
