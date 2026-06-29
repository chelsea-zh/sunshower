extends Node2D

const RAIN_SCENE = preload("res://scenes/raindrop.tscn")
const FLOWER_SCENE = preload("res://scenes/flower.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed() and not event.is_echo():
		if randf() > 0.75:
			var rain_instance = RAIN_SCENE.instantiate()
			rain_instance.position = Vector2(randi_range(-200, 1150), 100)
			$rain.add_child(rain_instance)


func _on_ground_body_entered(body: Node2D) -> void:
	if body is raindrop:
		if randf() > .5:
			var flower_instance = FLOWER_SCENE.instantiate()
			flower_instance.position = body.global_position
			flower_instance.position.y += randi_range(50, 150)
			$flowers.call_deferred("add_child", flower_instance)
		body.call_deferred("queue_free")
	pass # Replace with function body.
