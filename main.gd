extends Node

export (PackedScene) var collectable_scene
var score
export var base_fall_speed = 500
export var max_fall_speed = 1500
export var fall_speed = 500
var fall_velocity = 75


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	score = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	fall_speed = min(fall_speed + fall_velocity * delta, max_fall_speed)

func update_score(addToScore):
	score += addToScore
	$HUD/Score.text = str(int(score))

func _on_collectableTimer_timeout(): 
	var coll = collectable_scene.instance()
	var coll_location = get_node("Path2D/PathFollow2D")
	coll_location.offset = randi()
	coll.position = coll_location.position
	
	add_child(coll)
	
	
func _on_Player_body_shape_entered(body): 
	update_score(10)
	print_debug(body)
