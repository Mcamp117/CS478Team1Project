extends CharacterBody2D

@onready var camera = $Camera2D

@export var speed: float = 10
@onready var characterSprite = $AnimatedSprite2D
@onready var Inventory=preload("res://PlayerCharacter/inventory test scene.tscn")
var inventory
func _ready() -> void:
	inventory = Inventory.instantiate()
func _physics_process(_delta):
	$Camera2D/Label.text=str(Player.Health)
	var dirInput = Vector2(Input.get_action_strength("right")-Input.get_action_strength("left"),0)
	#print(dirInput)
	velocity = dirInput * speed
	if velocity.x<0:
		characterSprite.flip_h = true
	elif velocity.x >0:
		characterSprite.flip_h = false
	move_and_slide()
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
			camera.zoom+= Vector2(1,1)
		elif event.button_index == MouseButton.MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
			if camera.zoom >Vector2(1,1):
				camera.zoom-= Vector2(1,1)
	
	if event.is_action_pressed("inventory"):
		if !has_node("Inventory"):
			inventory.position = Vector2(-300,-10)
			add_child(inventory)
		else:
			inventory.queue_free()
			inventory = Inventory.instantiate()


func _on_lab_exit_body_entered(body: Node2D) -> void:
	Player.location = Vector2(3697,-1705)
	get_tree().call_deferred("change_scene_to_file", "res://OverWorld/world.tscn")


func _on_sewer_exit_body_entered(body: Node2D) -> void:
	get_tree().call_deferred("change_scene_to_file", "res://OverWorld/world.tscn")

func _on_tree_entered() -> void:
	$".".position = Player.matryoskaLocation
	pass # Replace with function body.

func _on_tree_exited() -> void:
	Player.location= Vector2(160,-2005)
	Player.matryoskaLocation=$".".position
	pass # Replace with function body.



	
func _on_music_finished() -> void:
	$"../music".play()
	pass # Replace with function body.
