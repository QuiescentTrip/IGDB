extends Node2D

# Use 'onready' to ensure that the variable is only assigned once the node is added to the scene
@onready var camera: Camera2D = $Camera2D
var window: Window
var windowRect: Rect2
var move_dir = Vector2.ZERO
var velocity = Vector2.ZERO

func _ready():
	window = get_tree().get_root()
	windowRect = Rect2(window.position, window.size)
	camera.anchor_mode = Camera2D.ANCHOR_MODE_FIXED_TOP_LEFT
	camera.position = Vector2(window.position) + windowRect.size / 2.0
	#$Player.position = Vector2(window.position) + windowRect.size / 2.8

func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		var win = Window.new()
		add_child(win)

	#windowRect = windowRect.grow(-10.0 * delta)
	print_debug(windowRect)

	if Input.is_action_pressed("right"):
		move_dir.x += 1

	if Input.is_action_pressed("left"):
		move_dir.x -= 1

	if Input.is_action_pressed("down"):
		move_dir.y += 1

	if Input.is_action_pressed("up"):
		move_dir.y -= 1

	move_dir = move_dir.normalized()

	velocity = move_dir * 50
	
	windowRect.position += velocity * delta
	
	
	window.position = windowRect.position
	window.size = windowRect.size

func _physics_process(delta):
	camera.position = get_tree().get_root().position
