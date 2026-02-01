class_name Thermometer extends TextureProgressBar

var tween: Tween

func _ready() -> void:
	max_value = GameManager.spawn_timer
	min_value = max_value*.15
	step = max_value*0.001
	value = min_value
	_update_step()

func _process(_delta) -> void:
	pass


func _update_step() -> void:
	value = 0
	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property(self, "value", max_value, GameManager.spawn_timer)
	await get_tree().create_timer(GameManager.spawn_timer).timeout
	_update_step()
