extends Area2D




func _on_body_entered(body: Node) -> void:
	if body.name == "CharacterBody2D":
		body.score +=1
		self.queue_free()
		print(body.score)
		
