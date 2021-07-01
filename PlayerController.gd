extends KinematicBody2D

export var MoveSpeed := 300.0 setget moveSpeedSet, moveSpeedGet

func moveSpeedSet(moveSpeed : float):
	if moveSpeed < 0.0:
		moveSpeed = 0.0
		
	MoveSpeed = moveSpeed

func moveSpeedGet() -> float:
	return MoveSpeed

func _init(moveSpeed : float):
	moveSpeedSet(moveSpeed)
