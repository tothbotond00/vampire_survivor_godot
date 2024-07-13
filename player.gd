extends CharacterBody2D

var health = 100.0;
signal health_depleted;

func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down");
	velocity = direction * 600;
	move_and_slide()
	if velocity.length() > 0:
		%HappyBoo.play_walk_animation();
	else :
		$HappyBoo.play_idle_animation();
		
	const DAMAGE_RATE = 10.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies();
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta;
		%HealthBar.value = health;
		if health <= 0.0:
			health_depleted.emit();
