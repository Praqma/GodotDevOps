extends 'res://addons/gut/test.gd'

var PlayerController = load("res://Scripts/Player/PlayerController.gd")

var controller;

func before_each():
	controller = PlayerController.new()

func after_each():
	controller.free()

var dash_values = [[3, 2], [0, 0]]
func test_dashing_decrease_dash_count_properly(params = use_parameters(dash_values)):
	controller.maxDashCount = params[0]
	
	controller.setupValues()
	
	controller.dash()
	
	assert_eq(controller.dashCount, params[1])

func test_landing_resets_dash_count():
	controller.maxDashCount = 3
	controller.dashCount = 0
	
	controller.land()
	
	assert_eq(controller.dashCount, controller.maxDashCount)
