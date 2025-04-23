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
@export var currentlyFighting : enemyList
var armor
var defense = 0
var weapon
var max_capacity = 20
var enemiesBeatenList=[]
var itemList = ["Health Pack", "Glasses", "Basic Sword"]
var questItemList = []
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
				DamageRange= Vector2(5,13)
				weapon = item
		"Scientist’s Creation":
				DamageRange= Vector2(15,23)
				weapon = item
		"City Cop Armour":
			defense=15
			armor=item
		"Glasses":
			defense=5
			armor=item
		var notWeapon:
				DamageRange = Vector2(0,8)
