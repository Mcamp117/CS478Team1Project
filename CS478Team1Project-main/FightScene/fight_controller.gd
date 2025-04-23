extends Node
@export var numberOfEnemies = 1
@onready var playerHealth = $"../CanvasLayer/GridContainer/PlayerHealth/PlayerHealthLabel"
@onready var overworldScene = preload("res://OverWorld/world.tscn")
@onready var MainMenuScene = preload("res://MainMenu/MainMenu.tscn")
@onready var PlayerAnim = $"../Player/AnimationPlayer"
@onready var Hitsound =$"../HitSound"
@onready var healButton = $"../CanvasLayer/Heal"
@onready var attackButton = $"../CanvasLayer/Attack"
var EnemyAnim 
var EnemyDamageRange : Vector2
var enHealth : int
var Enemy
@onready var EnemyHealthLabel = $"../CanvasLayer/GridContainer/EnemyHealth/EnemyHealthLabel"
@onready var PlayerArrow = $"../Player/PlayerArrow"
var EnemyArrow
@onready var missLabel = $miss
var turn = 0
func _ready() -> void:
	
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
	checkHealthPack()
	turn = whoGoesFirst()
	if turn%2 ==0:
		EnemyArrow.visible = false
	else:
		PlayerArrow.visible = false
		EnemyTurn()
func whoGoesFirst() -> int:
	return randi_range(0,1)
func damageEnemy() -> void:
	var damage = randi_range(Player.DamageRange.x,Player.DamageRange.y)
	spawn_label(damage)
	enHealth-=damage
	if enHealth <0:
		enHealth = 0
	EnemyHealthLabel.text=str(enHealth)
func damagePlayer() -> void:
	var damage = randi_range(EnemyDamageRange.x,EnemyDamageRange.y)
	damage -= Player.defense
	if damage <0:
		damage = 0
	spawn_label(damage)
	Player.Health-=damage
	if Player.Health <0:
		Player.Health = 0
	playerHealth.text=str(Player.Health)
func EnemyTurn() -> void:
	if turn%2 !=0:
		EnemyAnim.play("enemy_attack")
		await EnemyAnim.animation_finished
		missLabel.visible=false
		turn+=1
		EnemyArrow.visible = false
		PlayerArrow.visible=true
		attackButton.disabled=false
		healButton.disabled=false
		checkHealthPack()
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
		attackButton.disabled=true
		healButton.disabled=true
		PlayerAnim.play("player_attack")
		await PlayerAnim.animation_finished
		missLabel.visible=false
		turn+=1
		EnemyArrow.visible = true
		PlayerArrow.visible=false
		check4Victor()
		EnemyTurn()
	pass # Replace with function body.
func _on_heal_pressed() -> void:
	if turn%2 ==0:
		if Player.itemList.count("Health Pack") > 0:
			Player.itemList.erase("Health Pack")
			Player.Health+=10
			playerHealth.text=str(Player.Health)
			checkHealthPack()
			turn+=1
			attackButton.disabled=true
			healButton.disabled=true
			EnemyTurn()
	pass # Replace with function body.
func check4Victor() -> void:
	if Player.Health<=0:
		get_tree().change_scene_to_packed(MainMenuScene)
	if enHealth<=0:
		Player.enemiesBeatenList.append(Enemy)
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
func checkHealthPack()->void:
	healButton.text= "Heal (x" + str(Player.itemList.count("Health Pack")) +")"
