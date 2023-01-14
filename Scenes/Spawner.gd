extends Node2D


var PowerUpList = ["Shield", "Health", "Speed","Multi"]
var powerup_scene = preload("res://Scenes/PowerUp.tscn")




func _on_Timer_timeout():
	randomize()
	var inst = powerup_scene.instance();
	var position_y = randi() % 320;
	inst.position.y = position_y;
	inst.position.x = 640;
	var chance = randi() % 2;
	
	match chance:
		1:
			var power = randi() % PowerUpList.size();
			inst.create_power_up(PowerUpList[power]);
			add_child(inst)
