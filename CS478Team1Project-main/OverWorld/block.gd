extends CharacterBody2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if Dialogic.current_timeline != null:
		return

	# Play the dialogue
	Dialogic.start("BarrierTimeline")
	get_viewport().set_input_as_handled() # Replace with function body.
