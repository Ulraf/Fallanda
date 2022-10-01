extends Node2D

var score


# Called when the node enters the scene tree for the first time.
func _ready():
    score = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    update_score(delta)

func update_score(addToScore):
    score += addToScore
    $HUD/Score.text = str(int(score))
