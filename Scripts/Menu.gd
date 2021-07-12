extends VBoxContainer

onready var _transition_rect := $"../SceneTransitionRect"

func _on_Start_pressed():
	_transition_rect.transition_to("res://Scenes/Levels/ExampleLevel.tscn")

func _on_Exit_pressed():
	get_tree().quit()
