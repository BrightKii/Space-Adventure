extends StaticBody2D

"""
input_cooldown - это задержка между нажатием клавиш. Позволяет избежать ситуации, когда даже
	короткое нажатие клавиш воспринимается как многократное, что не даёт пользователю возможность
	сместиться вбок на желаемое количество раз (сразу поймёте, если установите input_cooldown в 0).
	Также в какой-то степени служит античитом. @export позволяет изменять это свойство в инспекторе,
	не лазя в код.
time_since_last_input - Это время с последнего нажатия клавиши. Изначально оно должно быть больше
	input_cooldown, чтобы считалось, что со старта игры не было нажатия клавиш.
"""
@export var input_cooldown = 0.1
var time_since_last_input = input_cooldown + 1

"""
screen_border_offset - это расстояние от самой крайней дорожки до границы игровой области. @export
	позволяет изменять это свойство в инспекторе, не лазя в код.
screen_size - это размер игровой области.
path_offset - это расстояние между дорожками.
"""
@export var screen_border_offset = 70
var screen_size
var path_offset


"""
В строке 34
path_offset = (screen_size.x - 2 * screen_border_offset) / 6
мы вычисляем расстояние между дорожками, если дорожек 7. Число 6 - не опечатка, так должно быть.
"""
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size   # Получаем размер игровой области.
	path_offset = (screen_size.x - 2 * screen_border_offset) / 6


"""
Немного костыльный способ обработки пользовательского ввода, столкновения и "телепортации".
get_axis("teleport_left", "teleport_right") возвращает -1 или 1, если нажаты клавиши,
соответствующие действиям "teleport_left" (A, ←) или "teleport_right" (D, →).
В строке 59
teleport_vector.x = clampf(path_offset * direction, screen_border_offset - position.x, screen_size.x - screen_border_offset - position.x)
мы вычисляем новую иксовую составляющую вектора, определяющую куда сместится корабль, а также
ограничиваем длину этого вектора расстоянием до отступов от границы игровой области. 
В строке 65
if move_and_collide(teleport_vector, false, 0.08, true):
производим смещение на тот самый вектор и проверяем, что произошло столкновение
(фактически move_and_collide() возвращает объект, описывающий столкновениее или null, если
столкновения не произошло). Последний параметр true, так как иначе столкновение фиксируется только
когда корабль движется. Остальные параметры по умолчанию.
Возможно, стоило реализовать телепортацию в _physics_process(), но я хз.
"""
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_since_last_input += delta
	var direction = Input.get_axis("teleport_left", "teleport_right")
	var teleport_vector = Vector2(0, 0)
	if direction and time_since_last_input > input_cooldown:
		teleport_vector.x = clampf(
			path_offset * direction, screen_border_offset - position.x,
			screen_size.x - screen_border_offset - position.x
		)
		time_since_last_input = 0
	
	if move_and_collide(teleport_vector, false, 0.08, true):
		# Здесь можно отправлять сигналы
		# Отладочный вывод
		prints("Произошло столкновение!")
	
	# Отладочный вывод
	prints('Позиция корабля по оси X =', position.x)


func _physics_process(delta):
	pass
