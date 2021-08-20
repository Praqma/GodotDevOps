extends Control

var time : float = 0.0
var runTimer : bool = false

onready var label = get_node("Label")

func _ready():
	runTimer = true

func _process(delta):
	if runTimer:
		time += delta
		
		var mils = fmod(time, 1) * 1000
		var secs = fmod(time, 60)
		var mins = floor(time / 60)
		
		label.text = "%02d:%02d:%03d" % [mins, secs, mils]

