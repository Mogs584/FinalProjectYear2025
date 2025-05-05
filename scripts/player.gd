extends CharacterBody2D



@export var bullet_scene: PackedScene
var health = 10
var speed = 50


var steering_factor = 10.0

func _ready():
	set_health(50)

func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")
	if Input.is_action_just_pressed("shoot"):
		shoot()


	if direction.length() > 1.0:
		direction = direction.normalized()

	var desired_velocity = speed * direction
	var steering_vector = desired_velocity - velocity
	velocity += steering_vector * steering_factor * delta
	position += velocity * delta

	if velocity.length() > 0.0:
		get_node("Sprite2D").rotation = velocity.angle() + PI / 2

	move_and_slide()

func set_health(new_health):
	health = new_health
	
func shoot():
	var bullet = bullet_scene.instantiate()
	bullet.position = global_position
	
	var mouse_position = get_global_mouse_position()
	bullet.direction = (mouse_position - self.global_position).normalized()
	bullet.mouse_position = mouse_position
	get_parent().add_child(bullet)
	
