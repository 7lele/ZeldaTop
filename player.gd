extends CharacterBody2D
var last = "Idle"
var speed  = 100 
const ACCEL = 100
var input: Vector2
@onready var animp : AnimatedSprite2D = $Animp
func get_input():
	input.x = Input.get_action_strength("d") - Input.get_action_strength("a")
	input.y = Input.get_action_strength("s") - Input.get_action_strength("w")
	return input.normalized()




func _process(delta: float) -> void:
	var playerInput = get_input()
	if input.x > 0 :
		last = "Idle right"
		animp.play("walk right")
	if input.x < 0 :
		last = "Idle left"
		animp.play("walk left")
	if input.y > 0 :
		last = "Idle"
		animp.play("walk down")
	if input.y < 0 :
		last = "Idle back"
		animp.play("walk up")
	
	if input == Vector2.ZERO:
		animp.play(last)
	velocity = lerp(velocity, playerInput * speed, delta * ACCEL)
	
	move_and_slide()
