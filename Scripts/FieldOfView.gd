extends Node2D

export var detectRadius : float = 200
export var viewAngle : float = 90
export var losSpeed : float = 3
export(int, LAYERS_3D_PHYSICS) var collisionLayer = 1
export var fovColor := Color(1,1,1,1)
export var losUndetectColor := Color(1,1,0,1)
export var losDetectColor := Color(1,0,0,1)
# Number of rays per degree
export (float) var coneResolution := 1.0

var targets = PoolVector2Array()
var losRange : float = 0

var debugAngles := []

func find_targets_inside_radius(entities) -> PoolVector2Array:
	targets = PoolVector2Array()
	for entity in entities:
		if global_position.distance_to(entity) < detectRadius:
			targets.append(entity)
	return targets

func find_targets_inside_cone(entities) -> PoolVector2Array:
	targets = PoolVector2Array()
	for entity in entities:
		var angleToEntity = rad2deg(global_transform.x.angle_to((entity - global_position).normalized()))
		if abs(angleToEntity) < viewAngle/2:
			targets.append(entity)
	return targets

func find_targets_with_raycast(entities) -> PoolVector2Array:
	targets = PoolVector2Array()
	var space_state = get_world_2d().direct_space_state
	for	entity in entities:
		var collision = space_state.intersect_ray(global_position, entity, [self], collisionLayer)
		if collision and collision.collider.is_in_group("detectable"):
			targets.append(entity)
	return targets

func _process(delta):
	draw_field_of_view()
	update()

func _physics_process(delta):
	var detectablesNodes = get_tree().get_nodes_in_group("detectable")
	var detectablesPos = PoolVector2Array()
	for n in detectablesNodes:
		detectablesPos.append(n.position)
	
	var inRadius = find_targets_inside_radius(detectablesPos)
	var inCone = find_targets_inside_cone(inRadius)
	targets = find_targets_with_raycast(inCone)
	
	if targets:
		losRange += losSpeed
		for target in targets:
			if global_position.distance_to(target) <= losRange:
				get_tree().reload_current_scene()
	else:
		losRange -= losSpeed
	losRange = clamp(losRange, 0, detectRadius)

func draw_field_of_view():
	var stepCount = round(viewAngle * coneResolution)
	var stepAngleSize = viewAngle / stepCount
	
	debugAngles.clear()
	for i in stepCount:
		var angle = -viewAngle/2 + stepAngleSize * i
		debugAngles.append(angle)

func _draw():
	for target in targets:
		draw_line(Vector2.ZERO, to_local(target), losUndetectColor)
		draw_line(Vector2.ZERO, to_local(target).normalized() * losRange, losDetectColor, 2)
	
	for a in debugAngles:
		var dir := Vector2(cos(deg2rad(a)), sin(deg2rad(a)))
		draw_line(Vector2.ZERO, dir.normalized() * detectRadius, Color.blue)
	
	draw_line(Vector2.ZERO, Vector2(cos(deg2rad(-viewAngle/2)) * detectRadius, sin(deg2rad(-viewAngle/2)) * detectRadius), fovColor)
	draw_line(Vector2.ZERO, Vector2(cos(deg2rad(viewAngle/2)) * detectRadius, sin(deg2rad(viewAngle/2)) * detectRadius), fovColor)
	draw_arc(Vector2.ZERO, detectRadius, deg2rad(-viewAngle/2), deg2rad(viewAngle/2), 32, fovColor)
