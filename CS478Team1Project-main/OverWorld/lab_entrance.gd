extends Area2D
@onready var ChangeLabScene =preload("res://LabScene/Lab.tscn")

func _on_body_entered(body: Node2D) -> void:
	print("Collision")
	get_tree().change_scene_to_packed(ChangeLabScene) 
