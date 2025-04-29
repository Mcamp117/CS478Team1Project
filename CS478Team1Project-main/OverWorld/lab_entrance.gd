extends Area2D

@onready var ChangeLabScene =preload("res://LabScene/Lab.tscn")

func _on_body_entered(body: Node2D) -> void:
	print("Collision")
	
