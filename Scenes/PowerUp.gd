extends KinematicBody2D

enum POWERUPTYPE {
	Shield,
	Health,
	Speed,
	Multi,
}
var velocity := Vector2.ZERO;
var speed := 200;
var powerup_type: String;
var speed_multiplier = 2;

func _ready():
	velocity.x = -speed;

func _process(_delta):
	move_and_slide(velocity)


func create_power_up(type: String):
	powerup_type = type;
	$AnimationPlayer.play(type)

func _on_Area2D_body_entered(body: KinematicBody2D):
	if body.name == "Player":
		queue_free()
		body.active_power = powerup_type;
		match powerup_type:
			"Speed":
				body.speed *= speed_multiplier;
				body.get_node("PowerUpTimer").start();
			_:
				pass;

			


func _on_VisibilityNotifier2D_screen_exited():
	queue_free();
