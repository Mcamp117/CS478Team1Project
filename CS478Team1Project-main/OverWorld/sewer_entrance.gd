extends Area2D

var entered = false

func _on_body_entered(body: Node2D) -> void:
	print("Entered")
	entered = true


func _on_body_exited(body: Node2D) -> void:
	print("Exited")
	entered = false

func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("enter"):
			get_tree().change_scene("res://SewerScene/Sewer.tscn")
