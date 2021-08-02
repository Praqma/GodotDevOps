extends Button


export (String) var level;
export (NodePath) var sceneTransitionPath

var sceneTransition

func _ready():
	sceneTransition = get_node(sceneTransitionPath)
func _on_level_start():
	sceneTransition.transition_to(level)
