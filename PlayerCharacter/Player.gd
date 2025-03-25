

@export var Health : int
@export var xp : int
###Inventory
var weapon
var max_capacity = 20

var itemList = []
var questItemList = []

func inventoryIsFull():
	return max_capacity == len(itemList)
func addItem(source):
	itemList.append(source)
func addQuestItem(source):
	questItemList.push(source)
func removeItem(source):
	if itemList.get(source)!=null:
		itemList.remove_at(int(itemList.get(source)))
func getItems():
	return itemList
func selectWeapon(source):
	weapon = source
