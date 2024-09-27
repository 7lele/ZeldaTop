extends CharacterBody2D

var speed  = 100 
const ACCEL = 100
var input: Vector2

func get_input():
	input.x = Input.get_action_strength("d") - Input.get_action_strength("a")
	input.y = Input.get_action_strength("s") - Input.get_action_strength("w")
	return input.normalized()




func _process(delta: float) -> void:
	var playerInput = get_input()
	
	
	velocity = lerp(velocity, playerInput * speed, delta * ACCEL)
	
	move_and_slide()
