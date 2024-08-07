"""
Костыль для движения примера метеорита, чтобы затестить коллизию. В начале он ставится посередине
игровой области. Лучше всего удалить этот скрипт вместе с примером метеорита. Комментировать
по-прежнему лень.
"""
extends CharacterBody2D


var SPEED = 300.0


func _ready():
	position.x = get_viewport_rect().size.x / 2


func _physics_process(delta):
	if position.y <= 0:
		velocity.y = SPEED
	elif position.y >= 810:
		velocity.y = -SPEED
	move_and_slide()
