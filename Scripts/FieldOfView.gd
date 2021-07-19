extends Node2D

export var detectRadius : float = 10

func find_targets(entities) -> PoolVector2Array:
	var targets = PoolVector2Array()
	for entity in entities:
		if position.distance_to(entity) < detectRadius:
			targets.append(entity)
	return targets
