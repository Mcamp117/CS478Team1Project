extends CharacterBody2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	# Prevent starting the fight if a dialogue is already running
	if Dialogic.current_timeline != null:
		return

	# Play the dialogue
	Dialogic.start("ScientistTimeline")
	get_viewport().set_input_as_handled()
