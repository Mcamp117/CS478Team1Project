extends Area2D

signal hitPlayer

@onready var ChangeLabScene =preload("res://LabScene/Lab.tscn")

func _on_body_entered(body: Node2D) -> void:
	print("Collision")
	if Dialogic.current_timeline != null:
		return

	# Start fight dialog timeline
	Dialogic.start("ScientistTimeline")
	if ChangeLabScene:
		hitPlayer.emit()
		get_tree().change_scene_to_packed(ChangeLabScene) 
	
