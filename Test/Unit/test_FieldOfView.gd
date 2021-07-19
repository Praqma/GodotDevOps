extends 'res://addons/gut/test.gd'

var fieldOfView = load("res://Scripts/FieldOfView.gd")
var fow
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
	fow = fieldOfView.new()
	fow.detectRadius = 10
	fow.viewAngle = 90

func before_each():
	entities = PoolVector2Array()

func after_all():
	fow.free()

func test_finds_targets_inside_detection_radius():
	entities.append(Vector2(5,0))
	
	var targets = fow.find_targets(entities)
	
	assert_eq(entities, targets)

func test_finds_targets_outside_detection_radius():
	entities.append(Vector2(15,0))
	
	var targets = fow.find_targets(entities)
	
	assert_ne(entities, targets)

func test_gets_count_of_targets_inside_detection_radius():
	entities.append(Vector2(2,0))
	entities.append(Vector2(5,0))
	entities.append(Vector2(9,0))
	entities.append(Vector2(11,0))
	entities.append(Vector2(25,0))
	
	var targets = fow.find_targets(entities)
	
	assert_eq(targets.size(), 3)

func test_finds_targets_inside_view_cone():
	entities.append(Vector2(4,2))
	
	var targets = fow.find_targets_inside_cone(entities)
	
	assert_eq(targets, entities)

func test_ignores_targets_outside_view_cone():
	entities.append(Vector2(4,-5))
	
	var targets = fow.find_targets_inside_cone(entities)
	
	assert_ne(targets, entities)
