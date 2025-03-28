extends CharacterBody2D
@onready var player = get_node("root/OverWorld/Player")
signal hitPlayer
var fightTestScene = preload("res://FightScene/fight.tscn")
func _on_area_2d_body_entered(body: Node2D) -> void:
	hitPlayer.emit()
	get_tree().change_scene_to_packed(fightTestScene)
