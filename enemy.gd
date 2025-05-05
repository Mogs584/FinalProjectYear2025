extends Area2D

func _process(delta: float) -> void:
	blow_up()


func _on_area_entered(area: Area2D) -> void:
	blow_up()

func blow_up():
	queue_free()
