extends Node2D

export(int) var id := 0
export (Array, NodePath) var nodePaths

var active := false

func change_state() -> void:
	active = not active
	for nodePath in nodePaths:
		if active:
			get_node(nodePath).set_process(false)
			get_node(nodePath).set_physics_process(false)
		else:
			get_node(nodePath).set_process(true)
			get_node(nodePath).set_physics_process(true)
