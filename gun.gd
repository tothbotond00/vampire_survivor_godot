extends Area2D

func _physics_process(_delta):
	var enemies = get_overlapping_bodies();
	if enemies.size() > 0 :
		var targetEnemy : Node2D = enemies.front();
		look_at(targetEnemy.global_position);
		
func shoot():
	const BULLET = preload("res://bullet.tscn");
	var new_bullet = BULLET.instantiate();
	new_bullet.global_position = %ShootingPoint.global_position;
	new_bullet.global_rotation = %ShootingPoint.global_rotation;
	%ShootingPoint.add_child(new_bullet);	


func _on_timer_timeout():
	shoot();
