extends Sprite

export var rotates := false
export(float, 0.0, 1.0) var rotateSpeed := 1.0
export(Array, int, -90, 90) var rotateArc := [0,45]

onready var cameraHead = $CameraHead

func _process(delta):
	if rotates:
		cameraHead.rotate(rotateSpeed * delta)
		if cameraHead.rotation > deg2rad(rotateArc.back()) :
			rotateSpeed *= -1
			cameraHead.rotation = deg2rad((rotateArc.back()))
		elif cameraHead.rotation < deg2rad(rotateArc[0]) :
			rotateSpeed *= -1
			cameraHead.rotation = deg2rad((rotateArc[0]))
