# Godot Touch Joystick Demo

Demonstration of how to implement a touchscreen joystick in Godot in order to move a character around in a two-dimensional world.

## Getting Started

Read the tutorial and explanation of the project [here](https://johnnysdabblings.code.blog/2020/01/22/how-to-make-a-touch-joystick-in-godot/).

Simply download the files to your Godot project.

### Installing

After downloading the files to your Godot project, wherever you decide to add your joystick, either in a HUD CanvasLayer or a basic scene for testing, hook up the signals emitted by the joystick.

```GDScript
# Called when the node enters the scene tree for the first time.
func _ready():
	$HUD/TouchJoystick/JoyStick.connect("joystick_moved",$Player,"_on_joystick_moved")
	$HUD/TouchJoystick/JoyStick.connect("joystick_released",$Player,"_on_joystick_released")
  ```
And that's really it. You can adjust any of the variables if you need to resize the control or change the speed of the character, etc.

## Built With

* [Godot](https://godotengine.org/) - The game engine

## Authors

* **Johnny Li** - *Initial work* - [Reptile18](https://github.com/reptile18)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

