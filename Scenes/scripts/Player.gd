extends KinematicBody2D

var velocity := Vector2.ZERO;
export var speed := 200;
var normal_shot = preload("res://Scenes/Projectile.tscn");
var active_power: String;

func _process(_delta):
	movement();
	move_and_slide(velocity);
	
	if Input.is_action_just_pressed("shoot") && $Timer.is_stopped():
		shoot();
	
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
	if Input.is_action_pressed("Right"):
		velocity.x = speed;
	if Input.is_action_pressed("top"):
		velocity.y = -speed;
		$AnimationPlayer.play("left");
	if Input.is_action_pressed("down"):
		velocity.y = speed;
		$AnimationPlayer.play("right");
		
	velocity = velocity.normalized() * speed;
	


func shoot() :
	var inst = normal_shot.instance();
	inst.position = $left_shoot_position.global_position;
	get_parent().add_child(inst);
	
	
	var inst_1 = normal_shot.instance();
	inst_1.position = $right_shoot_position.global_position;
	get_parent().add_child(inst_1);
	
	$Timer.start()
	$AudioStreamPlayer.play()


func _on_PowerOffTimer_timeout():
	match active_power:
		"Speed":
			speed = 100;
		_:
			pass;
