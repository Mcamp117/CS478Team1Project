extends Sprite3D
@export var EnemyHealth : int
@export var EnemyDamage : Vector2
@export var EnemyName : String
func dostuff()->void:
	get_parent().damagePlayer()
