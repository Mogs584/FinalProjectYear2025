extends Area2D
#var bullet_scene = get_node("")

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass




func blow_up():
	queue_free()
	AudioManager.blowup_sfx.play()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Bullet"):
		blow_up()
		print("hi")
	
