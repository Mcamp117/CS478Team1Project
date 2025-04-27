extends Control

var fightTestScene = preload("res://FightScene/fight.tscn")
var inventoryTest = preload("res://PlayerCharacter/inventory test scene.tscn")
var overWorldTestScene = preload("res://OverWorld/world.tscn")
var sewerTestScene = preload("res://SewerScene/Sewer.tscn")

func _ready() -> void:
	$SubViewportContainer/SubViewport/Camera3D/AnimationPlayer.play("RoundABoot")
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
	get_tree().change_scene_to_packed(sewerTestScene)
	pass # Replace with function body.


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$SubViewportContainer/SubViewport/Camera3D/AnimationPlayer.play("RoundABoot")
	pass # Replace with function body.


func _on__20__25_1_finished() -> void:
	$"4_20__25_1".play()
	pass # Replace with function body.
