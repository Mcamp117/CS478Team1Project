extends Node2D
@onready var overworldScene = preload("res://OverWorld/world.tscn")


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("entered exit area")
	get_tree().change_scene_to_packed(overworldScene)
