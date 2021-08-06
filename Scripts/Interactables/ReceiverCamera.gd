extends Node2D

export(int) var id := 0
export (Array, NodePath) var nodePaths
export(NodePath) var fovPolygonPath : NodePath

var active := false

func change_state() -> void:
	active = not active
	
	if active:
		get_node(fovPolygonPath).visible = false
		for nodePath in nodePaths:
			get_node(nodePath).set_process(false)
			get_node(nodePath).set_physics_process(false)
	else:
		get_node(fovPolygonPath).visible = true
		for nodePath in nodePaths:
			get_node(nodePath).set_process(true)
			get_node(nodePath).set_physics_process(true)
