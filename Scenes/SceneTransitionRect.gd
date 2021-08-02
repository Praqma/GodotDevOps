extends ColorRect

var isTransitioning := false

onready var _anim_player := $AnimationPlayer

func _ready():
	set_visible(true)
	_anim_player.play_backwards("Fade")

func transition_to(_next_scene) -> void:
	isTransitioning = true
	_anim_player.play("Fade")
	yield(_anim_player, "animation_finished")
	get_tree().change_scene(_next_scene)
	get_tree().paused = false
