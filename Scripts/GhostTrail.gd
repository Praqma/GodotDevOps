extends Sprite

func _ready():
	$AlphaTween.interpolate_property(self, "modulate", Color(1,1,1,1), Color(1,1,1,0), 0.6, Tween.TRANS_SINE, Tween.EASE_OUT)
	$AlphaTween.start()

func alphaTween_tween_completed(object, key):
	queue_free()
