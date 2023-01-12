extends KinematicBody2D

var velocity := Vector2.ZERO;
var speed := 200;


func _process(_delta):
	movement();
	var _a = move_and_slide(velocity);
	
	if self.position.x < 16 :
		self.position.x = 16;
	
	if self.position.x > 624 :
		self.position.x = 624;
	
	if self.position.y > 345 :
		self.position.y = 345;
	if self.position.y < 24 :
		self.position.y = 24;
	
func movement():
	velocity = Vector2.ZERO;
	$AnimationPlayer.play("idle")
	
	if Input.is_action_pressed("left"):
		velocity.x = -speed;
		$AnimationPlayer.play("left");
	if Input.is_action_pressed("Right"):
		velocity.x = speed;
		$AnimationPlayer.play("right");
	if Input.is_action_pressed("top"):
		print_debug(self.position.y);
		velocity.y = -speed;
	if Input.is_action_pressed("down"):
		velocity.y = speed;
	


