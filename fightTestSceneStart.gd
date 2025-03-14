extends Button

var fightTestScene = preload("res://fight.tscn")


func _on_pressed() -> void:
	get_tree().change_scene_to_packed(fightTestScene)
	pass # Replace with function body.
