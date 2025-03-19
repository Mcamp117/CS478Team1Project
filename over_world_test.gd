extends Button
var overWorldTestScene = preload("res://world.tscn")

func _on_pressed() -> void:
	get_tree().change_scene_to_packed(overWorldTestScene)
	pass
