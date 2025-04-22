extends Node
@export var numberOfEnemies = 1
@onready var playerHealth = $"../CanvasLayer/GridContainer/PlayerHealth/PlayerHealthLabel"
@onready var overworldScene = preload("res://OverWorld/world.tscn")
@onready var PlayerAnim = $"../Player/AnimationPlayer"
@onready var Hitsound =$"../HitSound"
@onready var EnemyAnim =$"../Enemy/AnimationPlayer"
@export var EnemyDamageRange = Vector2(0,8)
@export var enHealth = 100
@onready var EnemyHealthLabel = $"../CanvasLayer/GridContainer/EnemyHealth/EnemyHealthLabel"
@onready var PlayerArrow = $"../Player/PlayerArrow"
@onready var EnemyArrow = $"../Enemy/EnemyArrow"
var turn = 0
func _ready() -> void:
	PlayerAnim.play("RESET")
	EnemyAnim.play("RESET")
	playerHealth.text=str(Player.Health)
	turn = whoGoesFirst()
	if turn%2 ==0:
		EnemyArrow.visible = false
	else:
		PlayerArrow.visible = false
		EnemyTurn()
func whoGoesFirst() -> int:
	return randi_range(0,1)
func damageEnemy() -> void:
	var damage = randi_range(EnemyDamageRange.x,EnemyDamageRange.y)
	enHealth-=damage
	EnemyHealthLabel.text=str(enHealth)
func damage_player() -> void:
	var damage = randi_range(EnemyDamageRange.x,EnemyDamageRange.y)
	Player.Health-=damage
	playerHealth.text=str(Player.Health)
func EnemyTurn() -> void:
	if turn%2 !=0:
		EnemyAnim.play("enemy_attack")
		await EnemyAnim.animation_finished
		turn+=1
		EnemyArrow.visible = false
		PlayerArrow.visible=true
func _on_button_pressed() -> void: #take damage
	Player.Health-=10
	playerHealth.text=str(Player.Health)
	pass # Replace with function body.
func _on_button_2_pressed() -> void: #go back home debug
	get_tree().change_scene_to_packed(overworldScene)
	pass # Replace with function body.
func _on_button_3_pressed() -> void:#attack
	if turn%2 ==0:
		PlayerAnim.play("player_attack")
		await PlayerAnim.animation_finished
		turn+=1
		EnemyArrow.visible = true
		PlayerArrow.visible=false
		EnemyTurn()
	pass # Replace with function body.
