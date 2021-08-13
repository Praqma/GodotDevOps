extends StaticBody2D

export(int) var id := 0

var active := false

onready var collisionShape := get_node("CollisionShape2D")
onready var spriteClosed := get_node("Closed")
onready var spriteOpen := get_node("Open")

func _ready():
	collisionShape.disabled = false

func change_state() -> void:
	active = not active
	collisionShape.disabled = active
	
	if active:
		spriteOpen.visible = true
		spriteClosed.visible = false
	else:
		spriteOpen.visible = false
		spriteClosed.visible = true
