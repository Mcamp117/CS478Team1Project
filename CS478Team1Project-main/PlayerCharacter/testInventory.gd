extends Node2D

@onready var textbox = $RichTextLabel
@onready var selectbox = $ItemList
@onready var textedit = $TextEdit
@onready var canILabel = $YOUCANTEQUIPTHAT
@onready var DamageLabel = $Damage/Damage
@onready var DefenseLabel = $Defense/Defense
@onready var WeaponImage=$EquippedWeapon
@onready var ArmorImage=$EquippedArmor
var indx = null
func _ready() -> void:
	change_equipped_pics()
	DamageLabel.text = str(int(Player.DamageRange.x))+"-"+str(int(Player.DamageRange.y))
	DefenseLabel.text = str(Player.defense)
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
	if indx != null:
		Player.selectItem(indx)
	indx = null
	if !Player.canEquip:
		canILabel.visible = true
		await get_tree().create_timer(.50).timeout
		canILabel.visible = false

	selectbox.clear()
	add_items_toList()

	change_equipped_pics()
	DamageLabel.text = str(int(Player.DamageRange.x)) + "-" + str(int(Player.DamageRange.y))
	DefenseLabel.text = str(Player.defense)
	$RichTextLabel2.text = str(Player.weapon) + "\n" + str(Player.DamageRange) + "\n" + str(Player.armor) + "\n" + str(Player.defense)

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
func change_equipped_pics()-> void:
	ArmorImage.texture=Player.armorImage
	WeaponImage.texture=Player.weaponImage
	
