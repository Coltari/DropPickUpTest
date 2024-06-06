extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Events.playerDropItem.connect(addItem)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func addItem(scene,pos):
	if scene:
		var a = scene.instantiate()
		a.position = pos
		add_child(a)
