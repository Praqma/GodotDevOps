extends 'res://addons/gut/test.gd'

var fieldOfView = load("res://Scripts/FieldOfView.gd")
var fow

# Tests
	# [X] Inside radius
	# [X] Outside radius
	# [X] Count of targets inside radius
	# [ ] Updates properly
	# [ ] Inside radius and cone
	# [ ] Inside raidus but outside cone
	# [ ] Detection over time with target inside cone

func before_each(): #Can possibly be replaced with before_all
	fow = fieldOfView.new()
	fow.detectRadius = 10

func after_each(): #Can possibly be replaced with after_all
	fow.free()

func test_finds_targets_inside_detection_radius():
	var entities = PoolVector2Array()
	entities.append(Vector2(5,0))
	
	var targets = fow.find_targets(entities)
	
	assert_eq(entities, targets)

func test_finds_targets_outside_detection_radius():
	var entities = PoolVector2Array()
	entities.append(Vector2(15,0))
	
	var targets = fow.find_targets(entities)
	
	assert_ne(entities, targets)

func test_gets_count_of_targets_inside_detection_radius():
	var entities = PoolVector2Array()
	entities.append(Vector2(2,0))
	entities.append(Vector2(5,0))
	entities.append(Vector2(9,0))
	entities.append(Vector2(11,0))
	entities.append(Vector2(25,0))
	
	var targets = fow.find_targets(entities)
	
	assert_eq(targets.size(), 3)
