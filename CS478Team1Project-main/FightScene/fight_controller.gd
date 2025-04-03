extends Node
@export var numberOfEnemies = 1
@onready var playerHealth = $"../CanvasLayer/GridContainer/PlayerHealth/PlayerHealthLabel"
@onready var overworldScene = preload("res://OverWorld/world.tscn")
func _ready() -> void:
	playerHealth.text=str(Player.Health)
func _on_button_pressed() -> void:
	Player.Health-=10
	playerHealth.text=str(Player.Health)
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_packed(overworldScene)
	pass # Replace with function body.
