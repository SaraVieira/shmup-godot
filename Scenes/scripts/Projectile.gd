extends KinematicBody2D


var velocity := Vector2.ZERO;
var speed := 100;


# Called when the node enters the scene tree for the first time.
func _ready():
	velocity.x = speed;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_slide(velocity)
	
