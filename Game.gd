extends Spatial

onready var TimeRemaining = $HUD/TimeRemaining
onready var GameTime = $"Game Time"

func _on_Game_Time_timeout():
	pass # Replace with function body.

# warning-ignore:unused_argument
func _process(delta):
	TimeRemaining.text = str(int(GameTime.time_left))
