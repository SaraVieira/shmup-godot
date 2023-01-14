extends KinematicBody2D

var velocity := Vector2.ZERO;
var speed_multiplier := 2;
var default_speed : int = 200;
export var speed:int = default_speed;
var normal_shot = preload("res://Scenes/Projectile.tscn");
var active_power: String;
var has_shield: bool = false;
var health := 3;
var multi_shot := false;

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
	
func inst_with_postion(pos):
	var inst = normal_shot.instance();
	self.add_collision_exception_with(inst);
	inst.position = pos.global_position;
	get_parent().add_child(inst);
	
	return inst;


func shoot() :
	if multi_shot:
		var inst = inst_with_postion($left_shoot_position)
		var inst_1 = inst_with_postion($right_shoot_position)
		var inst_2 = inst_with_postion($left_shoot_position)
		var inst_3 = inst_with_postion($right_shoot_position)
		var v = 25;
		inst.velocity.y = -v;
		inst_1.velocity.y = -v;
		inst_2.velocity.y = v;
		inst_3.velocity.y = v;
	else:
		inst_with_postion($left_shoot_position)
		inst_with_postion($right_shoot_position)
	
	
	
	
	
	
	
	$Timer.start()
	$AudioStreamPlayer.play()


func _on_Area2D_body_entered(body):
	has_shield = false;

func enable_multi_shot():
	multi_shot = true;
	yield(get_tree().create_timer(5), "timeout")
	multi_shot = false;
	
func enable_speed():
	speed *= speed_multiplier;
	yield(get_tree().create_timer(10), "timeout")
	speed = default_speed;	

func enable_shield():
	has_shield = true;
	$shield.visible = true;
	$shield/ShieldAnimation.play("shield");
