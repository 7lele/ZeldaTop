extends CharacterBody2D

var speed  = 400 

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("a","d","w","s")
	velocity = direction * speed
	
	move_and_slide()
