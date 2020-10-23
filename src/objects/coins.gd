extends Area2D

# runs before the ready function
onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

func _on_coin_body_entered(body):
	anim_player.play("fade")
