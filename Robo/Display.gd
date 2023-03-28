extends Control

# Constants for HUD components

onready var X_Position = $GridContainer/X_Position_Value

onready var Y_Position = $GridContainer/Y_Position_Value

onready var Z_Position = $GridContainer/Z_Position_Value

onready var X_Rotation_Position = $GridContainer/X_Rotation_Value

onready var Y_Rotation_Position = $GridContainer/Y_Rotation_Value

onready var Z_Rotation_Position = $GridContainer/Z_Rotation_Value

# Signal received by the player, with the positions

func _on_KinematicBody_positionjogador(px, py, pz, rx, ry, rz):

	X_Position.text = str(px)

	Y_Position.text = str(py)

	Z_Position.text = str(pz)

	X_Rotation_Position.text = str(rx)

	Y_Rotation_Position.text = str(ry)

	Z_Rotation_Position.text = str(rz)
