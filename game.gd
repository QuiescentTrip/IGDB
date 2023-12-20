extends Node
@onready var window = $Window
@onready var viewport = $Window/Main_scene
@onready var main =  $Main_scene
@onready var window2 = $Window2
@onready var viewport2 = $Window2/Main_scene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Path2D/PathFollow2D.progress += 10
	viewport.position = -window.position
	window.position = get_viewport().get_mouse_position() - Vector2(60, 60)
	viewport2.position = -window2.position
	window2.position = $Path2D/PathFollow2D.position
	
	
	
