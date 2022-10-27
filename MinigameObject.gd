extends StaticBody
# warning-ignore:unused_signal
signal activated
var used = false

export (NodePath) var minigame

func _on_MiniGameObject_activated():
	if !used:
		used = true
		var mgNode = get_node(minigame)
		mgNode.connect("done", self, "_on_minigame_done")
		mgNode.show()

func _on_minigame_done():
	var mgNode = get_node(minigame)
	mgNode.hide()
	mgNode.queue_free()
