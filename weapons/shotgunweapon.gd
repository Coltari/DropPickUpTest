extends Node2D

@onready var myType = ItemHandler.itemTypes.WEAPON
@onready var myIdentifier = ItemHandler.itemIdentifiers.SHOTGUN	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func drop(pos):
	Events.drop.emit(myType, myIdentifier, pos)
	queue_free()
