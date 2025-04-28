extends CharacterBody2D

signal hitPlayer

@onready var fightTestScene = load("res://FightScene/fight.tscn")

func _ready() -> void:
	if Player.enemiesBeatenList.count("Cop") == 1:
		self.queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	# Prevent starting the fight if a dialogue is already running
	if Dialogic.current_timeline != null:
		return
		
	# Play the dialogue
	Dialogic.start("FightTimeline")
	get_viewport().set_input_as_handled()
	
	# Wait until dialogue finishes
	await Dialogic.timeline_ended
	
	# After dialogue ends, start the fight
	if fightTestScene:
		hitPlayer.emit()
		Player.currentlyFighting = Player.enemyList.Cop
		get_tree().change_scene_to_packed(fightTestScene)
	else:
		print("Error: Fight scene is not valid.")
