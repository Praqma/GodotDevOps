extends Control

export(NodePath) var pausePath : NodePath

onready var _transition_rect := $"../SceneTransitionRect"
onready var timer = get_node("Control")

var didWin : bool = false

func win():
	if not didWin:
		visible = true
		timer.runTimer = false
		get_tree().paused = true
		didWin = true
		get_node(pausePath).didWin = true

func _on_Menu_pressed():
	get_tree().paused = false
	_transition_rect.transition_to("res://Scenes/MainMenu.tscn")

func _on_Restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
