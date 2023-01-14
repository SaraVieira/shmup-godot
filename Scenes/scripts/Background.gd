extends Sprite

var speed = 8
export var reset_scrol := 640
export var start_scrol := 0


func _process(delta):
	self.position.x -= delta * speed

	if self.position.x > reset_scrol:
		self.position.x = start_scrol
