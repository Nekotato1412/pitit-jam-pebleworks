extends StaticBody
# warning-ignore:unused_signal
signal activated
var used = false

export (NodePath) var minigame
export (NodePath) var player_loc
onready var player = get_node(player_loc)

func _on_MiniGameObject_activated():
	if !used:
		used = true
		player.locked = true
		var mgNode = get_node(minigame)
		mgNode.connect("done", self, "_on_minigame_done")
		mgNode.show()

func _on_minigame_done():
	var mgNode = get_node(minigame)
	player.locked = false
	mgNode.hide()
	mgNode.queue_free()
