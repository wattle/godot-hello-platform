extends Button

export(String, FILE) var next_scene_path := ""

func _on_PlayButton_button_up():
	get_tree().change_scene(next_scene_path)
