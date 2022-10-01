extends AnimatedSprite

var pressed = false
var direction = 0
var sensativity = 2
var prev_touch_pos : Vector2

var speed = 50

# Called when the node enters the scene tree for the first time.
func _ready():
    playing = true

func _input(event):
    if event is InputEventMouseButton:
        if event.is_pressed():
            pressed = true
            prev_touch_pos = event.position
        else:
            pressed = false
            direction = 0
        
    if pressed && event is InputEventMouseMotion:
        var motion = event.position.distance_to(prev_touch_pos)
        if (motion > sensativity):
            if (event.position.direction_to(prev_touch_pos).x > 0):
                direction = -1
            else:
                direction = 1
        prev_touch_pos = event.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if direction != 0:
        var movement = delta * speed * direction;
        position.x += movement
