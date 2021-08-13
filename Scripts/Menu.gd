extends VBoxContainer

onready var panel = $"../Panel"

func _on_Exit_pressed():
	get_tree().quit()

func _on_Controls_pressed():
	panel.visible = !panel.visible
