extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= (delta * get_node("/root/Main").fall_speed)


func _on_VisibilityNotifier2D_screen_exited():
	#if (position.y < 0): queue_free()
	pass
