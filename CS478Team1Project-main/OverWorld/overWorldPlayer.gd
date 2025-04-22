extends CharacterBody2D
@export var speed: float = 10
@onready var characterSprite = $AnimatedSprite2D
func _physics_process(_delta):
	$Label.text=str(Player.Health)
	var dirInput = Vector2(
		Input.get_action_strength("right")-Input.get_action_strength("left"),
		Input.get_action_strength("down")-Input.get_action_strength("up")
	)
	print(dirInput)
	velocity = dirInput * speed
	if velocity.x<0:
		characterSprite.flip_h = true
	else:
		characterSprite.flip_h = false
	move_and_slide()
