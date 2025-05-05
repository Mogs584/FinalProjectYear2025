extends Area2D

@export var speed = 200
var direction = Vector2.ZERO
var mouse_position = Vector2.ZERO

func _process(delta: float) -> void:
	position += direction * speed * delta
	look_at(mouse_position)
	rotation += PI / 2
