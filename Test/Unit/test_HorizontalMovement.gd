extends 'res://addons/gut/test.gd'

var PlayerController = load("res://PlayerController.gd")

func test_move_speed_is_always_positive_value():
	var controller = PlayerController.new(10.0)
	assert_between(controller.moveSpeedGet(), 0.0, INF)
	
	controller.free()
	controller = PlayerController.new(-10.0)	
	assert_between(controller.moveSpeedGet(), 0.0, INF)
	
	controller.moveSpeedSet(-10.0)
	assert_between(controller.moveSpeedGet(), 0.0, INF)
	controller.free()
