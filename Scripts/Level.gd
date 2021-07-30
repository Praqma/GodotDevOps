extends Button


export (String) var level;

onready var sceneTransition = $"../../../SceneTransitionRect"

func _on_level_start():
	sceneTransition.transition_to(level)
