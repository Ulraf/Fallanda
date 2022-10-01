extends Container


var base_sprite = preload("objects/base_bg.tscn")
var cur_bg : Sprite
var next_bg : Sprite

var speed = 500
var background_y0
var background_height

# Called when the node enters the scene tree for the first time.
func _ready():
    cur_bg = base_sprite.instance()
    add_child(cur_bg)
    
    background_y0 = cur_bg.position.y
    background_height = cur_bg.texture.get_height() * cur_bg.scale.y
    
    next_bg = create_next_bg()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    var delta_movement = delta * speed
    
    cur_bg.position.y -= delta_movement
    next_bg.position.y -= delta_movement
    
    if (cur_bg.position.y + background_height < background_y0):
        cur_bg.queue_free()
        cur_bg = next_bg
        
        next_bg = create_next_bg()

func create_next_bg():
    next_bg = base_sprite.instance()
    next_bg.position.y = cur_bg.position.y + background_height
    
    if (randi() % 2 == 0):
        next_bg.scale.x *= -1
    
    add_child(next_bg)
    
    return next_bg
