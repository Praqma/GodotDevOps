extends Node2D

export var detectRadius : float = 200
export var viewAngle : float = 90

func find_targets_inside_radius(entities) -> PoolVector2Array:
	var targets = PoolVector2Array()
	for entity in entities:
		if position.distance_to(entity) < detectRadius:
			targets.append(entity)
	return targets

func find_targets_inside_cone(entities) -> PoolVector2Array:
	var targets = PoolVector2Array()
	for entity in entities:
		var angleToEntity = rad2deg(transform.x.angle_to((entity - position).normalized()))
		if abs(angleToEntity) < viewAngle/2:
			targets.append(entity)
	return targets

func _process(delta):
	update()

func _draw():
	draw_line(position, position + Vector2(cos(deg2rad(-viewAngle/2)) * detectRadius, sin(deg2rad(-viewAngle/2)) * detectRadius), Color(1,0,0,1))
	draw_line(position, position + Vector2(cos(deg2rad(viewAngle/2)) * detectRadius, sin(deg2rad(viewAngle/2)) * detectRadius), Color(1,0,0,1))
	draw_arc(position, detectRadius, deg2rad(-viewAngle/2), deg2rad(viewAngle/2), 32, Color(1,0,0,1))
