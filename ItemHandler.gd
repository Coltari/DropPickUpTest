extends Node

enum itemTypes {WEAPON,PICKUP}
enum itemIdentifiers {SHOTGUN,PISTOL,STICK}

var items = []

func _ready():
	items.append([itemTypes.PICKUP,itemIdentifiers.SHOTGUN,preload("res://weapons/shotgunweapon.tscn")])
	items.append([itemTypes.WEAPON,itemIdentifiers.SHOTGUN,preload("res://pickups/shotgunpickup.tscn")])
	
	Events.pickup.connect(findItem)
	Events.drop.connect(findItem)

func findItem(itemType, itemId, _pos):
	for i in items:
		if i[0] == itemType:
			if i[1] == itemId:
				if itemType == itemTypes.PICKUP:
					Events.givePlayerItem.emit(i[2])
				elif itemType == itemTypes.WEAPON:
					Events.playerDropItem.emit(i[2],_pos)
