"""
Костыль для движения примера метеорита, чтобы затестить коллизию. Комментировать лень.
Лучше всего удалить этот скрипт вместе с примером метеорита.
"""
extends CharacterBody2D


var SPEED = 300.0


func _physics_process(delta):
	if position.y <= 0:
		velocity.y = SPEED
	elif position.y >= 720:
		velocity.y = -SPEED
	move_and_slide()
