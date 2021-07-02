extends KinematicBody2D

export var moveSpeed := 300.0 setget moveSpeedSet, moveSpeedGet

func moveSpeedSet(value : float):
	moveSpeed =  max(value, 0)

func moveSpeedGet() -> float:
	return moveSpeed

