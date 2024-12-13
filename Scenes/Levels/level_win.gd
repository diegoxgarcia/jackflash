extends Node3D

@onready var player = $Player
@onready var state_machine = $Player/StateMachine
@onready var animation_player = $AnimationPlayer
@onready var inside_game_menu = $InsideGameMenu

func _ready():
	state_machine.current_state.transitioned.emit(state_machine.current_state, "dance")
	animation_player.play("dance_floor")
	pass

func _process(delta):	
	if Input.is_action_just_pressed("ui_cancel"):
		inside_game_menu.visible = true
	pass
