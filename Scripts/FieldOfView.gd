extends Node2D

export var detectRadius : float = 200
export var viewAngle : float = 90
export(int, LAYERS_3D_PHYSICS) var collisionLayer = 1

var targets

func find_targets_inside_radius(entities) -> PoolVector2Array:
	targets = PoolVector2Array()
	for entity in entities:
		if position.distance_to(entity) < detectRadius:
			targets.append(entity)
	return targets

func find_targets_inside_cone(entities) -> PoolVector2Array:
	targets = PoolVector2Array()
	for entity in entities:
		var angleToEntity = rad2deg(transform.x.angle_to((entity - position).normalized()))
		if abs(angleToEntity) < viewAngle/2:
			targets.append(entity)
	return targets

func find_targets_with_raycast(entities) -> PoolVector2Array:
	targets = PoolVector2Array()
	var space_state = get_world_2d().direct_space_state
	for	entity in entities:
		var collision = space_state.intersect_ray(position, entity, [self], collisionLayer)
		if collision and collision.collider.is_in_group("detectable"):
			targets.append(entity)
			print(collision.position)
	return targets

func _process(delta):
	update()

func _physics_process(delta):
	var detectablesNodes = get_tree().get_nodes_in_group("detectable")
	var detectablesPos = PoolVector2Array()
	for n in detectablesNodes:
		detectablesPos.append(n.position)
	
	var inRadius = find_targets_inside_radius(detectablesPos)
	var inCone = find_targets_inside_cone(inRadius)
	var targets = find_targets_with_raycast(inCone)

func _draw():
	draw_line(Vector2.ZERO, Vector2(cos(deg2rad(-viewAngle/2)) * detectRadius, sin(deg2rad(-viewAngle/2)) * detectRadius), Color(1,0,0,1))
	draw_line(Vector2.ZERO, Vector2(cos(deg2rad(viewAngle/2)) * detectRadius, sin(deg2rad(viewAngle/2)) * detectRadius), Color(1,0,0,1))
	draw_arc(Vector2.ZERO, detectRadius, deg2rad(-viewAngle/2), deg2rad(viewAngle/2), 32, Color(1,0,0,1))
