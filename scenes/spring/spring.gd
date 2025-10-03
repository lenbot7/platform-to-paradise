extends Area2D


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		animated_sprite_2d.play("bounce")
		if body.velocity.y > 0:
			body.velocity.y = -500
		else:
			body.velocity.y += -500
		body.extrajumped_already = false
