extends Sprite

signal joystick_moved
signal joystick_released
var radiusJoyStick 
var radiusJoyBase 
var maxRadius
var touchInsideJoystick = false
# Called when the node enters the scene tree for the first time.
func _ready():
	radiusJoyStick = global_scale.x * texture.get_size().x/2;
	radiusJoyBase = get_node("../JoyBase").global_scale.x * $"../JoyBase".texture.get_size().x/2
	maxRadius = radiusJoyBase - radiusJoyStick

func _input(event):
	if event is InputEventScreenDrag:
		if touchInsideJoystick == true:
			position.x = position.x + event.relative.x
			position.y = position.y + event.relative.y
			if position.length() > maxRadius:
				var angle = position.angle()
				position.x = cos(angle) * maxRadius
				position.y = sin(angle) * maxRadius
			emit_signal("joystick_moved", position)
	if event is InputEventScreenTouch:
		if !event.pressed:
			position.x = 0
			position.y = 0
			emit_signal("joystick_released")
		if event.pressed:
			touchInsideJoystick = (event.position - global_position).length() <= radiusJoyStick

