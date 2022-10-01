extends Node2D

var score
export var base_fall_speed = 500
export var max_fall_speed = 1500
export var fall_speed = 500
var fall_velocity = 75


# Called when the node enters the scene tree for the first time.
func _ready():
    score = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    fall_speed = min(fall_speed + fall_velocity * delta, max_fall_speed)
    $HUD/Score.text = str(int(fall_speed))
