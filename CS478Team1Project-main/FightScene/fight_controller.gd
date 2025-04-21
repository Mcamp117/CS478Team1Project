extends Node
@export var numberOfEnemies = 1
@onready var playerHealth = $"../CanvasLayer/GridContainer/PlayerHealth/PlayerHealthLabel"
@onready var overworldScene = preload("res://OverWorld/world.tscn")
@onready var PlayerAnim = $"../Player/AnimationPlayer"
@onready var Hitsound =$"../HitSound"
@export var EnemyDamageRange = Vector2(0,8)
var turn = 0
func _ready() -> void:
	playerHealth.text=str(Player.Health)
	turn = whoGoesFirst()
	if turn%2 ==0:
		$"../Enemy/EnemyArrow".visible = false
	else:
		$"../Player/PlayerArrow".visible = false
func whoGoesFirst() -> int:
	return randi_range(0,1)
func damage_player() -> void:
	var damage = randi_range(EnemyDamageRange.x,EnemyDamageRange.y)
	Player.Health-=damage
	playerHealth.text=str(Player.Health)
func _on_button_pressed() -> void: #take damage
	Player.Health-=10
	playerHealth.text=str(Player.Health)
	pass # Replace with function body.
func _on_button_2_pressed() -> void: #go back home debug
	get_tree().change_scene_to_packed(overworldScene)
	pass # Replace with function body.
func _on_button_3_pressed() -> void:#attack
	PlayerAnim.play("player_attack")
	await PlayerAnim.animation_finished
	pass # Replace with function body.
