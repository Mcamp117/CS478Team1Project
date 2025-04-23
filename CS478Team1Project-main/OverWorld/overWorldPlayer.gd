extends CharacterBody2D
@export var speed: float = 10
@onready var characterSprite = $AnimatedSprite2D
@onready var Inventory=preload("res://PlayerCharacter/inventory test scene.tscn")
var inventory
var isPaused = false
func _ready() -> void:
	inventory = Inventory.instantiate()
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
	elif velocity.x >0:
		characterSprite.flip_h = false
	move_and_slide()
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("inventory"):
		if isPaused:
			Engine.time_scale=1
		else:
			Engine.time_scale=0
		isPaused = !isPaused
		
		if !has_node("Inventory"):
			inventory.position = Vector2(-300,-100)
			add_child(inventory)
		else:
			inventory.queue_free()
			inventory = Inventory.instantiate()
