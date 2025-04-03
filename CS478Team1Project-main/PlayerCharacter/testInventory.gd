extends Node2D

@onready var textbox = $RichTextLabel
@onready var selectbox = $ItemList
@onready var textedit = $TextEdit
var indx : int
func _onAddPressed() -> void:
	Player.addItem(textedit.text)
	selectbox.clear()
	for i in Player.itemList:
		selectbox.add_item(i)
	pass # Replace with function body.


func _onRemovePressed() -> void:
	if indx!=null and indx< len(Player.itemList) and indx >= 0:
		Player.removeItem(indx)
	selectbox.clear()
	for i in Player.itemList:
		selectbox.add_item(i)
	indx = -1
	pass # Replace with function body.


func _onCheckPressed() -> void:
	textbox.text = str(Player.getItems())
	pass # Replace with function body.


func _onLengthPressed() -> void:
	textbox.text = str(Player.inventoryIsFull())
	pass # Replace with function body.


func _on_item_list_item_selected(index: int) -> void:
	indx = index
	$RichTextLabel2.text= "index actual: "+ str(indx) + "\nindex expected: " + str(index)
	pass # Replace with function body.
