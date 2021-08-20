extends Node2D

export(NodePath) var winScreenPath : NodePath
onready var winScreen = get_node(winScreenPath)

func _on_WinArea2D_body_entered(body):
	if(body.is_in_group("Player")) :
		winScreen.win()
