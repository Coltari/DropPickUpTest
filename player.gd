extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var helditem

func _ready():
	Events.givePlayerItem.connect(getItem)

func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		if helditem:
			#add some x and a bit of y random to drop infront of player not on them
			var pos = Vector2(position.x+150, position.y+randi_range(-5,5))
			helditem.drop(pos)

func getItem(scene):
	if scene:
		helditem = scene.instantiate()
		add_child(helditem)
