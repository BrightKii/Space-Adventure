extends Node2D

func _on_start_pressed():
	get_tree().change_scene_to_file("res://space.tscn")


func _on_settings_pressed():
	get_tree().change_scene_to_file("res://settings.tscn")

func _on_exit_pressed():
	get_tree().quit()
