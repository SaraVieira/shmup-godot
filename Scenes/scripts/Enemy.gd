extends KinematicBody2D

var time;
var normal_shot = preload("res://Scenes/Projectile.tscn");

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize();
	time = rand_range(1,5);
	$Timer.wait_time = time;

func _on_Timer_timeout():
	var shot = normal_shot.instance();
	self.add_collision_exception_with(shot);
	get_parent().add_child(shot);
	shot.position = $Position2D.global_position;
	shot.velocity.x = -shot.speed;
	shot.get_node("Sprite").rotation_degrees = 90;
	shot.modulate =  Color(.3,1,1,1);
