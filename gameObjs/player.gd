extends Node2D

var speed = 1
var acceleration = 50


# Called when the node enters the scene tree for the first time.
func _ready():
	$SpeedLines.scale.y = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	speed += (delta * acceleration)
	var scale = min(1, speed / 100)
	for childLine in $SpeedLines.get_children():
		childLine.points[1].y = scale * -30
