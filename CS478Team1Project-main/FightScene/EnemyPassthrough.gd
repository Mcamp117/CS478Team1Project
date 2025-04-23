extends Sprite3D
@export var EnemyHealth : int
@export var EnemyDamage : Vector2
func dostuff()->void:
	get_parent().damagePlayer()
