extends Node2D

"""
size - это размер игровой области.
relative_border_offset - это относительное расстояние от самой крайней дорожки до границы игровой
	области (то, какую часть игровой области будет занимать расстояние от крайней дорожки до
	границы). @export позволяет изменять это свойство в инспекторе, не лазя в код.
screen_border_offset - это расстояние от самой крайней дорожки до границы игровой области.
path_offset - это расстояние между дорожками.
"""
var size
@export var relative_border_offset = 0.05
var screen_border_offset
var path_offset

"""
В начале получаем размер игровой области. Далее находим расстояние от крайней дорожки до границы на
на основе относительного расстояния и ширины игровой области.
В строке 31
path_offset = (size[0] - 2 * screen_border_offset) / 6
мы вычисляем расстояние между дорожками, если дорожек 7. Число 6 - не опечатка, так должно быть.
Далее получаем ноду корабля.
В строке 33
player.position = Vector2(size[0]/2, size[1]*7/8)
мы вычисляем (0-й и 1-й элемент равнозначны свойствам x и y) начальную позицию игрока (середина по
оси X, 7/8 от верха окна по оси Y).
"""
func _ready():
	size = get_viewport_rect().size
	screen_border_offset = relative_border_offset*size[0]
	path_offset = (size[0] - 2 * screen_border_offset) / 6
	var player = find_child("Ship")
	player.position = Vector2(size[0]/2, size[1]*7/8)
