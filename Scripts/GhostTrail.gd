extends Sprite

func _ready():
	$AlphaTween.interpolate_property(self, "modulate", Color(0,0.88,1,1), Color(0,0.88,1,0), 0.3, Tween.TRANS_SINE, Tween.EASE_OUT)
	$AlphaTween.start()

func alphaTween_tween_completed(object, key):
	queue_free()
