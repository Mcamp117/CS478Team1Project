extends Node2D

@onready var textbox = $RichTextLabel
@onready var selectbox = $ItemList
@onready var textedit = $TextEdit
var indx = null
func _ready() -> void:
	add_items_toList()
func _onAddPressed() -> void:
	Player.addItem(textedit.text)
	selectbox.clear()
	add_items_toList()
	pass # Replace with function body.


func _onRemovePressed() -> void:
	if indx!=null:
		Player.removeItem(indx)
	selectbox.clear()
	add_items_toList()
	indx = null
	pass # Replace with function body.


func _onCheckPressed() -> void:
	textbox.text = str(Player.getItems())
	pass # Replace with function body.


func _onLengthPressed() -> void:
	textbox.text = str(Player.inventoryIsFull())
	pass # Replace with function body.


func _on_item_list_item_selected(index: int) -> void:
	indx = index
	$RichTextLabel2.text= "index actual: "+ str(indx) + "\nindex expected: " + str(index)+"\nlength of list: " + str(len(Player.itemList))
	pass # Replace with function body.


func _on_button_5_pressed() -> void:
	if indx!=null:
		Player.selectItem(indx)
	indx = null
	$RichTextLabel2.text= str(Player.weapon) + "\n" + str(Player.DamageRange) + "\n" + str(Player.armor) + "\n" + str(Player.defense)
	pass # Replace with function body.
func add_items_toList()-> void:
	for i in Player.itemList:
		match i:
			"Basic Sword":
				selectbox.add_item(i,load("res://GameDesigns/DefaultSwordItem (1).png"))
			"Scientist’s Creation":
				selectbox.add_item(i,load("res://GameDesigns/PixelBuster.png"))
			"City Cop Armour":
				selectbox.add_item(i,load("res://GameDesigns/CityCopArmor.png"))
			"Glasses":
				selectbox.add_item(i,load("res://GameDesigns/Glasses.png"))
			"Health Pack":
				selectbox.add_item(i,load("res://GameDesigns/Health_Pack.png"))
			"Ooze":
				selectbox.add_item(i,load("res://GameDesigns/Ooze.png"))
