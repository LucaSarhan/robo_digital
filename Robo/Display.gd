extends Control

# Constants for HUD components

onready var X_Position = $GridContainer/X_Position_Value

onready var Y_Position = $GridContainer/Y_Position_Value

onready var Z_Position = $GridContainer/Z_Position_Value

# Signal received by the player, with the positions

func _on_KinematicBody_positionjogador(px, py, pz):
	
	X_Position.text = str(px)
	
	Y_Position.text = str(py)
	
	Z_Position.text = str(pz)
