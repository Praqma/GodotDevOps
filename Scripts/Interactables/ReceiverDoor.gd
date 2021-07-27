extends StaticBody2D

export(int) var id := 0

var active := false

onready var collisionShape := get_node("CollisionShape2D")

func _ready():
	collisionShape.disabled = false

func change_state() -> void:
	active = not active
	collisionShape.disabled = active
