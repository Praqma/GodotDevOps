 extends Control

onready var _transition_rect := $"../SceneTransitionRect"

var didWin : bool = false

func _input(event):
	if event.is_action_pressed("pause") and not _transition_rect.isTransitioning:
		pause()

func _on_Resume_pressed():
	pause()

func _on_Menu_pressed():
	_transition_rect.transition_to("res://Scenes/MainMenu.tscn")
	pause()

func _on_Restart_pressed():
	get_tree().reload_current_scene()
	pause()

func _on_Exit_pressed():
	get_tree().quit()

func pause():
	if didWin:
		return
	
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state
