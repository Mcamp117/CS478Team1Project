extends CharacterBody2D
@export var speed: float = 10
func _physics_process(_delta):
	var dirInput = Vector2(
		Input.get_action_strength("right")-Input.get_action_strength("left"),
		Input.get_action_strength("down")-Input.get_action_strength("up")
	)
	print(dirInput)
	velocity = dirInput * speed
	move_and_slide()
