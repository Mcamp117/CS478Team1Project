extends CharacterBody2D
@export var speed: float = 10
@onready var characterSprite = $AnimatedSprite2D
@onready var Inventory=preload("res://PlayerCharacter/inventory test scene.tscn")
@onready var camera = $Camera2D
var inventory
func _ready() -> void:
	inventory = Inventory.instantiate()
func _physics_process(_delta):
	$Label.text=str(Player.Health)
	var dirInput = Vector2(
		Input.get_action_strength("right")-Input.get_action_strength("left"),
		Input.get_action_strength("down")-Input.get_action_strength("up")
	)
	#print(dirInput)
	velocity = dirInput * speed
	if velocity.x<0:
		characterSprite.flip_h = true
	elif velocity.x >0:
		characterSprite.flip_h = false
	move_and_slide()
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("inventory"):
		if !has_node("Inventory"):
			inventory.position = Vector2(-300,-10)
			add_child(inventory)
		else:
			inventory.queue_free()
			inventory = Inventory.instantiate()
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
			camera.zoom+= Vector2(1,1)
		elif event.button_index == MouseButton.MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
			if camera.zoom >Vector2(0,0):
				camera.zoom-= Vector2(1,1)

func _on_over_world_tree_exiting() -> void:
	Player.location=self.position
	pass # Replace with function body.


func _on_over_world_tree_entered() -> void:
	Player.matryoskaLocation = Vector2(0,30)
	self.position=Player.location
	pass # Replace with function body.


func _on_lab_entrance_body_entered(body: Node2D) -> void:
	get_tree().call_deferred("change_scene_to_file","res://LabScene/Lab.tscn")


func _on_sewer_entrance_body_entered(body: Node2D) -> void:
	get_tree().call_deferred("change_scene_to_file","res://SewerScene/Sewer.tscn")
