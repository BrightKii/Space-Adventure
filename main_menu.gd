extends Node2D
"""
По поводу всего того, что написано ниже:
	func здесь - это по сути автоматически созданные обработчики сигналов, поступающих
	с кнопок, которые собственно указаны в названии.
	Через tree() идёт взаимодействие с иерархией и собственно с внутренними файлами проекта.
	В целом quit() это выход из программы, а change_scene_to_file меняет активную сцену т.е.
	уровень или отображаемый экран в нашем проекте.
"""
func _on_start_pressed():
	get_tree().change_scene_to_file("res://space.tscn")

func _on_settings_pressed():
	get_tree().change_scene_to_file("res://settings.tscn")

func _on_exit_pressed():
	get_tree().quit()
