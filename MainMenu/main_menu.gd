extends Control

var fightTestScene = preload("res://FightScene/fight.tscn")
var inventoryTest = preload("res://PlayerCharacter/inventory test scene.tscn")
var overWorldTestScene = preload("res://OverWorld/world.tscn")
var pauseMenuTestScene = preload("res://PauseMenu/pause_menu.tscn")


func _on_inventory_test_pressed() -> void:
	get_tree().change_scene_to_packed(inventoryTest)
	pass # Replace with function body.


func _on_over_world_test_pressed() -> void:
	get_tree().change_scene_to_packed(overWorldTestScene)
	pass # Replace with function body.


func _on_fight_test_pressed() -> void:
	get_tree().change_scene_to_packed(fightTestScene)
	pass # Replace with function body.


func _on_pausemenutest_pressed() -> void:
	get_tree().change_scene_to_packed(pauseMenuTestScene)
	pass # Replace with function body.
