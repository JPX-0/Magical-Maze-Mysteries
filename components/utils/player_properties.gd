class_name MainCharacterProp extends Node

var health:float = 100:
	get:
		return health
	set (value):
		health = clamp(value, 0, 100)

var jumping:int = 0:
	get:
		return jumping
	set (value):
		jumping = clamp(value, 0, 2)

var dashing:bool = false:
	get:
		return dashing
	set (value):
		dashing = value

const SPEED:float = 120 # velocity +X
const JUMP:float = -275 # velocity +Y
const DASH:float = 8 # velocity *X
const CROUCH:float = 0.4 # velocity *X

