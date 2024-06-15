extends CharacterBody2D

var SPEED = 60.0
var follow = false
var playerBody : CharacterBody2D
var follow_distance = 17
	   
func _physics_process(delta):	
	if playerBody:
		var distance_to_player = global_position.distance_to(playerBody.global_position)
		if distance_to_player > follow_distance:
			
			var direction = ( playerBody.global_position - global_position ).normalized()
			if direction.x > 0:
				$CatAnimation.flip_h = true
			if direction.x < 0:
				$CatAnimation.flip_h = false
					
			$CatAnimation.play("walk")				
			velocity.x = (direction.x)  * SPEED
			velocity.y = (direction.y)  * SPEED
			move_and_slide()
		else:
			$CatAnimation.play("idle")
			velocity = Vector2.ZERO
	


func _on_area_2d_body_entered(body):
		if body.name == "Player":
			follow = true			
			playerBody = body
