extends Node2D

export (NodePath) var sceneTransitionPath

var sceneTransition

func _ready():
	sceneTransition = get_node(sceneTransitionPath)

func _on_WinArea2D_body_entered(body):
	if(body.is_in_group("Player")) :
		sceneTransition.transition_to("res://Scenes/MainMenu.tscn")
