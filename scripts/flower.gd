class_name flower extends CharacterBody2D

var clockwise = true
var type = ["daisy", "hydrangea", "orchid", "tulip"]
var picked = false

func _ready() -> void:
	rotation_degrees = 0
	$AnimatedSprite2D.frame = 0
	$AnimatedSprite2D.animation = type[randi_range(0, 3)]
	$Control.mouse_filter = Control.MOUSE_FILTER_PASS
	picked = false

func _process(_delta: float) -> void:
	if clockwise:
		rotation_degrees += .5
		if rotation_degrees >= 15:
			clockwise = false
	if not clockwise:
		rotation_degrees -= .5
		if rotation_degrees <= -15:
			clockwise = true
		
	if picked:
		global_position.x = get_global_mouse_position().x
		global_position.y = get_global_mouse_position().y + 75


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is raindrop:
		if randf() > 0 and $AnimatedSprite2D.frame < 4:
			$AnimatedSprite2D.frame += 1
	pass # Replace with function body.


func _on_area_2d_mouse_entered() -> void:
	if $AnimatedSprite2D.frame == 4:
		$AnimatedSprite2D.frame = 5
		#$Control.mouse_filter = Control.MOUSE_FILTER_STOP
	pass # Replace with function body.


func _on_area_2d_mouse_exited() -> void:
	if $AnimatedSprite2D.frame == 5:
		$AnimatedSprite2D.frame = 4
		#$Control.mouse_filter = Control.MOUSE_FILTER_PASS
	pass # Replace with function body.


func _on_area_2d_picked() -> void:
	if $AnimatedSprite2D.frame >= 4:
		picked = not picked
		print(picked)
	pass # Replace with function body.
