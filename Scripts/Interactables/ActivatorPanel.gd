extends Area2D

export(int) var id := 0
export(Color) var onColor := Color.green
export(Color) var offColor := Color.red

signal activator_triggered()

onready var receivers := get_tree().get_nodes_in_group("receivers")
onready var sprite := get_node("Sprite3")

func _ready():
	sprite.modulate = offColor
	if id != 0:
		for receiver in receivers:
			if receiver.id == id:
				connect("activator_triggered", receiver, "change_state")

func press() -> void:
	if Input.is_action_just_pressed("interact") and overlaps_body($"../Player"):
		if sprite.modulate == offColor:
			sprite.modulate = onColor
		elif sprite.modulate == onColor:
			sprite.modulate = offColor
		emit_signal("activator_triggered")

func _process(delta):
	press()
