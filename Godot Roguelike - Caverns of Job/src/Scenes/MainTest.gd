extends Node

var characters = []
var character = {"ref": Node2D, "speed": 0}
var turncount = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for child in $Characters.get_children():
		print(child)
		var new = character.duplicate(true)
		new.ref = child
		new.speed = child.stats.speed
		characters.append(new)
	print(characters.size())
	pass # Replace with function body.

func _input(event):
	if (
		Input.is_action_pressed("move_down") or
		Input.is_action_pressed("move_up") or
		Input.is_action_pressed("move_right") or
		Input.is_action_pressed("move_left")):
		process_turn()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func process_turn():
	for Character in characters:
		Character.ref.is_turn = true
#		yield(Character.ref.process_turn(), "completed")
		Character.ref.process_turn()
		pass
	turncount += 1
	$Label.text = str(turncount)
