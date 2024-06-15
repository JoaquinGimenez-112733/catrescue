extends CharacterBody2D
class_name Player

var on_boundaries = false
const speed = 30.0

func _physics_process(delta):
#
	# Verificar la entrada del jugador (WASD o teclas de flecha)
	if Input.is_action_pressed("up"):
		$Animation.play("run")
		position += Vector2(0,-1)
		
	if Input.is_action_pressed("down"):
		$Animation.play("run")
		position += Vector2(0,1)
		
	if Input.is_action_pressed("left"):

			$Animation.play("run")
			position += Vector2(-1,0)
			$Animation.flip_h = true
		
	if Input.is_action_pressed("right"):

			$Animation.play("run")
			position += Vector2(1,0)
			$Animation.flip_h = false
		
	if not Input.is_anything_pressed():
		$Animation.play("idle")
	move_and_slide()
	
