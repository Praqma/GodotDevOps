extends Control

export (Array, String) var levelPaths : Array
export (Array, String) var levelNames : Array
export (NodePath) var sceneTransitionPath

var sceneTransition
var levelIndex;

onready var levelLabels = [$Level,$Level2,$Level3]


func _ready():
	sceneTransition = get_node(sceneTransitionPath)
	levelIndex = 0.0
	
func _process(_delta):
	if Input.is_action_just_pressed("move_up"):
		levelIndex += 1
	elif Input.is_action_just_pressed("move_down"):
		levelIndex -= 1
	
	levelIndex = clamp(levelIndex, 0, levelPaths.size()-1)
	
	for i in range(0, levelLabels.size()):
		levelLabels[i].text = levelNames[levelIndex]
		
	if Input.is_action_just_pressed("Start"):
		sceneTransition.transition_to(levelPaths[levelIndex])
