extends Node2D

export var player_controlled = false
var is_turn = false
var cell_size = 32

var stats = {"speed": 5}
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_player_dir() -> Vector2:
	if Input.is_action_pressed("wait"):
		return Vector2.ZERO
	var dir = Vector2(
		-Input.get_action_strength("move_left") + Input.get_action_strength("move_right"),
		-Input.get_action_strength("move_up") + Input.get_action_strength("move_down")
	)
	if (
		Input.is_action_pressed("move_northeast") and
		Input.is_action_just_pressed("move_northwest") and
		Input.is_action_just_pressed("move_southeast") and
		Input.is_action_just_pressed("move_southwest")
	):
		return Vector2.ZERO
	elif Input.is_action_pressed("move_northeast"):
		return Vector2(1,1)
	elif Input.is_action_pressed("move_northwest"):
		return Vector2(-1,1)
	elif Input.is_action_pressed("move_southeast"):
		return Vector2(1,-1)
	elif Input.is_action_pressed("move_southwest"):
		return Vector2(-1,-1)
	return dir

func process_turn():
	var dir = Vector2.ZERO
	var actions = []
	if player_controlled:
		dir = get_player_dir()
	else:
		dir = ai_character_movement()
		actions = ai_character_actions()
	move_character(dir)
	character_act(actions)

func move_character(dir):
	self.position += dir * cell_size

func character_act(actions):
	pass

func ai_character_movement() -> Vector2:
	return Vector2((randi()%2-1),(randi()%2-1))
	
func ai_character_actions():
	pass
