extends Area2D

func _process(delta: float) -> void:
	pass




func blow_up():
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Bullet"):
		blow_up()
		print("hi")
