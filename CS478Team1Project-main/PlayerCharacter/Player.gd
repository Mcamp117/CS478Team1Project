extends Node

@onready var Health =100
@onready var xp =0
###Inventory
enum enemyList  {
	Cop,
	Rat,
	YourFeelings,
	Oppenheimer
}
var location: Vector2
@export var currentlyFighting : enemyList
var armor
var defense = 0
var armorImage=null
var weapon
var weaponImage=null
var max_capacity = 20
var enemiesBeatenList=[]
var itemList = ["Health Pack", "Glasses", "Basic Sword"]
var questItemList = []
var canEquip : bool
var DamageRange = Vector2(0,8)
func inventoryIsFull():
	return max_capacity == len(itemList)
func addItem(source):
	itemList.append(source)
func addQuestItem(source):
	questItemList.push(source)
func removeItem(source):
	if itemList.get(source)!=null:
		itemList.remove_at(source)
func getItems():
	return itemList
func selectItem(source):
	var item = itemList.get(source)
	match item:
		"Basic Sword":
				canEquip=true
				DamageRange= Vector2(5,13)
				weapon = item
				weaponImage=load("res://GameDesigns/DefaultSwordItem (1).png")
		"Scientist’s Creation":
				canEquip=true
				DamageRange= Vector2(15,23)
				weapon = item
				weaponImage=load("res://GameDesigns/PixelBuster.png")
		"City Cop Armour":
			canEquip=true
			defense=15
			armor=item
			armorImage=load("res://GameDesigns/CityCopArmor.png")
		"Glasses":
			canEquip=true
			defense=5
			armor=item
			armorImage=load("res://GameDesigns/Glasses.png")
		var notWeapon:
				canEquip=false
