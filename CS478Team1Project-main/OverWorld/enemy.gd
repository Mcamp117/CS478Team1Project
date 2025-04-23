extends CharacterBody2D
#@onready var player = get_node("root/OverWorld/Player")
signal hitPlayer

func _on_area_2d_body_entered(body: Node2D) -> void:
	var fightTestScene = load("res://FightScene/fight.tscn")
	hitPlayer.emit()
	Player.currentlyFighting=Player.enemyList.Cop
	#changing scenes during physics action is dangerous
	if fightTestScene:
		# Change the scene after ensuring the PackedScene is valid
		get_tree().call_deferred("change_scene_to_packed", fightTestScene)
	else:
		print("Error: The scene is not valid.")
	
