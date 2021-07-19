extends Node2D

export var detectRadius : float = 10
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
