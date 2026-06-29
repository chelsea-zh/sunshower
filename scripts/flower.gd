class_name flower extends CharacterBody2D

var clockwise = true

func _ready() -> void:
	rotation_degrees = 0
	$AnimatedSprite2D.frame = 0

func _process(_delta: float) -> void:
	if clockwise:
		rotation_degrees += .5
		if rotation_degrees >= 15:
			clockwise = false
	if not clockwise:
		rotation_degrees -= .5
		if rotation_degrees <= -15:
			clockwise = true
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is raindrop:
		pass
	pass # Replace with function body.
