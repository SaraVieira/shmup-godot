extends Sprite


var speed = 8;
export var reset_scrol := 360;
export var start_scrol := 0;

func _process(delta):
	self.position.y += delta * speed;
	
	if self.position.y > reset_scrol:
		self.position.y = start_scrol
