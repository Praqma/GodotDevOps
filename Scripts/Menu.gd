extends VBoxContainer

onready var _transition_rect := $"../SceneTransitionRect"

func _on_Exit_pressed():
	get_tree().quit()
