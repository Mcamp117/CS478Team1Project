extends Node3D
func  _process(delta: float) -> void:
	$".".rotate_y(.2*delta)



func _on_audio_stream_player_3d_finished() -> void:
	$"../AudioStreamPlayer3D".play()
	pass # Replace with function body.
