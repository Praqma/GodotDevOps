extends 'res://addons/gut/test.gd'

var fieldOfView = load("res://Scripts/FieldOfView.gd")
var fov
var entities

# Tests
	# [X] Inside radius
	# [X] Outside radius
	# [X] Count of targets inside radius
	# [ ] Updates properly
	# [X] Inside cone
	# [X] Outside cone
	# [ ] Detection over time with target inside cone

func before_all():
	fov = fieldOfView.new()
	fov.detectRadius = 10
	fov.viewAngle = 90

func before_each():
	entities = PoolVector2Array()

func after_all():
	fov.free()

func test_finds_targets_inside_detection_radius():
	entities.append(Vector2(5,0))
	
	var targets = fov.find_targets_inside_radius(entities)
	
	assert_eq(targets, entities)

func test_ignores_targets_outside_detection_radius():
	entities.append(Vector2(15,0))
	
	var targets = fov.find_targets_inside_radius(entities)
	
	assert_ne(targets, entities)

func test_gets_count_of_targets_inside_detection_radius():
	entities.append(Vector2(2,0))
	entities.append(Vector2(5,0))
	entities.append(Vector2(9,0))
	entities.append(Vector2(11,0))
	entities.append(Vector2(25,0))
	
	var targets = fov.find_targets_inside_radius(entities)
	
	assert_eq(targets.size(), 3)

func test_finds_targets_inside_view_cone():
	entities.append(Vector2(4,2))
	
	var targets = fov.find_targets_inside_cone(entities)
	
	assert_eq(targets, entities)

func test_ignores_targets_outside_view_cone():
	entities.append(Vector2(4,-5))
	
	var targets = fov.find_targets_inside_cone(entities)
	
	assert_ne(targets, entities)
