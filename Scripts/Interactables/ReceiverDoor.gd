extends StaticBody2D

export(int) var id := 0

var active := false

onready var collisionShape := get_node("CollisionShape2D")
onready var sprite := get_node("Sprite")

var doorClosed = preload("res://Assets/Sprites/DoorClosed.png")
var doorOpen = preload("res://Assets/Sprites/DoorOpened.png")

func _ready():
	collisionShape.disabled = false

func change_state() -> void:
	active = not active
	collisionShape.disabled = active
	
	if active:
		sprite.texture = doorOpen
	else:
		sprite.texture = doorClosed
