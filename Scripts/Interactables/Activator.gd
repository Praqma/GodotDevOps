extends Area2D

export(int) var id := 0

signal activator_triggered()

onready var receivers := get_tree().get_nodes_in_group("receivers")

func _ready():
	if id != 0:
		for receiver in receivers:
			if receiver.id == id:
				connect("activator_triggered", receiver, "change_state")

func press() -> void:
	if Input.is_action_just_pressed("interact") and overlaps_body($"../Player"):
		emit_signal("activator_triggered")

func _process(delta):
	press()
