extends StaticBody
# warning-ignore:unused_signal
signal activated
var used = false

export (NodePath) var minigame

func _on_MiniGameObject_activated():
	if !used:
		used = true
		get_node(minigame).show()
		
