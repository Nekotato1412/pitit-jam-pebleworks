extends Spatial

onready var TimeRemaining = $HUD/TimeRemaining
onready var GameTime = $"Game Time"
onready var Camera = $Camera
onready var Player = $Player

func _on_Game_Time_timeout():
	pass # Replace with function body.

func _physics_process(delta):
	Camera.translation.x = Player.translation.x

# warning-ignore:unused_argument
func _process(delta):
	TimeRemaining.text = str(int(GameTime.time_left))
