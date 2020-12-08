extends Button

export(String, FILE) var next_scene_path := ""

func _on_PlayButton_button_up():
	Autoloader.goto_scene(next_scene_path)
	# get_tree().change_scene(next_scene_path)
