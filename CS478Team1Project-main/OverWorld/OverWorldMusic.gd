extends Node2D
func _ready() -> void:
	$Owrodl.play()


func _on_owrodl_finished() -> void:
	$Owrodl.play()
	pass # Replace with function body.
