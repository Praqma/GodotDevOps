extends Node2D

onready var _transition_rect := $"CanvasLayer/SceneTransitionRect"


func _on_WinArea2D_body_entered(body):
	if(body.is_in_group("Player")) :
		_transition_rect.transition_to("res://Scenes/MainMenu.tscn")
