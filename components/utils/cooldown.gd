class_name Cooldown extends Node

#var timer:MeTimer = preload("res://components/utils/timer.gd").new()
#func _ready():
	#add_child(timer)

# ---------- dash ----------
var dash:float = 5:
	get:
		return dash
	set (value):
		dash = clamp(value, 2, 5)

var dash_started:bool = false:
	get:
		return dash_started
	set (value):
		dash_started = value

const DASH_ACTIVE: float = 0.05

# ---------- hit ----------
var attack_sword:float = 1:
	get:
		return attack_sword
	set (value):
		attack_sword = clamp(value, 0.5, 1)

# ---------- jump ----------
var double_jump:float = 15:
	get:
		return double_jump
	set (value):
		double_jump = clamp(value, 5, 15)

# ---------- invulnerable ----------
var invulnerable:float = 2:
	get:
		return invulnerable
	set (value):
		invulnerable = clamp(value, 2, 2)

# ---------- soon ----------
var attack_fire:float = 3:
	get:
		return attack_fire
	set (value):
		attack_fire = clamp(value, 1, 3)

var shield_water:float = 70:
	get:
		return shield_water
	set (value):
		shield_water = clamp(value, 25, 70)

var create_earth:float = 70:
	get:
		return create_earth
	set (value):
		create_earth = clamp(value, 25, 70)


#func start_dash():
	#character.dashing = true
	#dash_started = true
	#timer._create(dash, fin_cooldown_dash)
#func fin_cooldown_dash():
	#dash_started = false
