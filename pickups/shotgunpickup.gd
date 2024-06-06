extends Node2D

@onready var myType = ItemHandler.itemTypes.PICKUP
@onready var myIdentifier = ItemHandler.itemIdentifiers.SHOTGUN	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	if area.is_in_group("player"):
		Events.pickup.emit(myType, myIdentifier, null)
		queue_free()
