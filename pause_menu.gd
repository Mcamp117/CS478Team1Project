extends Control
@onready var pause_Menu = $"."
var isPaused = false
func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		pauseGame()
func pauseGame():
	if isPaused:
		pause_Menu.hide()
		Engine.time_scale=1
	else:
		pause_Menu.show()
		Engine.time_scale=0
	isPaused = !isPaused
func onChar() -> void:
	print("open character sheet")
func onInv() -> void:
	print("open inventory")
func onQuest() -> void:
	print("Open Quest Log")
func onSave() -> void:
	print("opne save menu")
func onLoad() -> void:
	print("opne load menu")
func onSet() -> void:
	print("open settings")
func onQuit() -> void:
	get_tree().quit()
