class_name Rubios extends CharacterBody2D 

#signal player_health_updated(new_health)

var timer:MeTimer = preload("res://components/utils/timer.gd").new()
var cooldown:Cooldown = preload("res://components/utils/cooldown.gd").new()
var habilities:Habilities = preload("res://components/utils/habilities.gd").new()
var character:MainCharacterProp = preload("res://components/utils/player_properties.gd").new()

@onready var audio_jump = $AudioStreamPlayer2D
@onready var animation:AnimatedSprite2D = $AnimatedSprite2D
@onready var scene_1 = %Scene1

var gravity:float = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction_move:int
var jump: int
var status_character:int
var character_in_floor:bool
var keys:int =0

func _ready():
	add_child(timer)
	status_character = 0
func _physics_process(delta):
	_move(delta)
	animations()
	effects()
	print(keys)

func _move(delta) -> void:
	direction_move = Input.get_axis("left", "right")
	jump = Input.is_action_just_pressed("jump")
	if !is_on_floor():
		velocity.y += gravity * delta
	else:
		character.jumping = 0
	if jump:
		if is_on_floor():
			jump = 1
			velocity.y = character.JUMP
			character.jumping = 1
		elif character.jumping == 1 && habilities.double_jump:
			jump = 1
			character.jumping = 2
		elif !habilities.double_jump || character.jumping == 2:
			jump = 0
	if jump:
		velocity.y = character.JUMP
	if direction_move:
		velocity.x = direction_move * character.SPEED 
		if direction_move < 0:
			transform[0].x = -1
		else:
			transform[0].x = 1
		if Input.is_action_just_pressed("dash") && !cooldown.dash_started && !character.dashing:
			start_dash()
		elif Input.is_action_pressed("crouch"):
			velocity.x *= character.CROUCH
		if character.dashing:
			velocity.x *= character.DASH
	else:
		velocity.x = move_toward(velocity.x, 0, character.SPEED)
	move_and_slide()

func animations():
	if is_on_floor() && status_character == 3:
		animation.play("in_floor")
		timer._create(0.152, impact)
		status_character = 1
	if velocity.y != 0:
		character_in_floor = false
	if direction_move && status_character == 1 && character_in_floor:
		#if velocity.y == 0:
		animation.play("walking")
	if jump:
		if velocity.y != 0:
			animation.play("jumping")
		status_character = 2
	elif velocity.y > 25:
		animation.play("falling_down")
		status_character = 3
	if is_on_floor() && !direction_move && status_character == 0:
		animation.stop()

func effects():
	if jump:
		audio_jump.play(0)
		audio_jump.volume_db = 2

func impact():
	character_in_floor = true

func start_dash():
	character.dashing = true
	cooldown.dash_started = true
	timer._create(cooldown.DASH_ACTIVE, fin_action_dash)
	timer._create(cooldown.dash, fin_cooldown_dash)
func fin_action_dash():
	character.dashing = false
func fin_cooldown_dash():
	cooldown.dash_started = false
