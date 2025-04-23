extends Node
@export var numberOfEnemies = 1
@onready var playerHealth = $"../CanvasLayer/GridContainer/PlayerHealth/PlayerHealthLabel"
@onready var overworldScene = preload("res://OverWorld/world.tscn")
@onready var MainMenuScene = preload("res://MainMenu/MainMenu.tscn")
@onready var PlayerAnim = $"../Player/AnimationPlayer"
@onready var Hitsound =$"../HitSound"
var EnemyAnim 
var EnemyDamageRange : Vector2
var enHealth : int
@onready var EnemyHealthLabel = $"../CanvasLayer/GridContainer/EnemyHealth/EnemyHealthLabel"
@onready var PlayerArrow = $"../Player/PlayerArrow"
var EnemyArrow
@onready var missLabel = $miss
var turn = 0
func _ready() -> void:
	var Enemy
	if Player.currentlyFighting == Player.enemyList.Cop:
		Enemy = load("res://FightScene/CopEnemy.tscn")
	if Player.currentlyFighting == Player.enemyList.Oppenheimer:
		Enemy = load("res://FightScene/OppenheimerEnemy.tscn")
	add_child(Enemy.instantiate())
	enHealth = $"Enemy".EnemyHealth
	EnemyDamageRange = $"Enemy".EnemyDamage
	EnemyAnim =$"Enemy/AnimationPlayer"
	EnemyArrow = $"Enemy/EnemyArrow"
	missLabel.visible=false
	PlayerAnim.play("RESET")
	EnemyAnim.play("RESET")
	playerHealth.text=str(Player.Health)
	EnemyHealthLabel.text = str(enHealth)
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
	spawn_label(damage)
	enHealth-=damage
	EnemyHealthLabel.text=str(enHealth)
func damagePlayer() -> void:
	var damage = randi_range(EnemyDamageRange.x,EnemyDamageRange.y)
	spawn_label(damage)
	Player.Health-=damage
	playerHealth.text=str(Player.Health)
func EnemyTurn() -> void:
	if turn%2 !=0:
		EnemyAnim.play("enemy_attack")
		await EnemyAnim.animation_finished
		missLabel.visible=false
		turn+=1
		EnemyArrow.visible = false
		PlayerArrow.visible=true
		$"../CanvasLayer/Attack".disabled=false
		check4Victor()
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
		missLabel.visible=false
		turn+=1
		EnemyArrow.visible = true
		PlayerArrow.visible=false
		check4Victor()
		$"../CanvasLayer/Attack".disabled=true
		EnemyTurn()
	pass # Replace with function body.
func checkHealth(john, healthbar)-> void:
		##cjecl hea;th
		john = 0
func check4Victor() -> void:
	if Player.Health<=0:
		get_tree().change_scene_to_packed(MainMenuScene)
	if enHealth<=0:
		Player.enemiesBeatenList.append(1)
		get_tree().change_scene_to_packed(overworldScene)
func playHitSound() -> void:
	$"../HitSound".play()
func spawn_label(damage):
	if damage<1:
		missLabel.text="miss"
		missLabel.remove_theme_color_override("font_color")
	else:
		playHitSound()
		missLabel.text=str(damage)
		missLabel.add_theme_color_override("font_color", Color(1, 0.5, 0))
	missLabel.visible = true
	#var screen_size = get_viewport().get_size()
	missLabel.position.x += randi_range(-40, 40)
	missLabel.position.y += randi_range(-40, 40)
