extends ParallaxBackground

export var autoScroll : bool = false
export var autoScrollSpeed : int = 10

func _process(delta):
	if(autoScroll) :
		scroll_offset += Vector2.LEFT * autoScrollSpeed * delta
