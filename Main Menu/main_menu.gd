extends Control

@onready var play_game_button: Button = %PlayGameButton
@onready var credits_button: Button = %CreditsButton
@onready var back_button: Button = %BackButton

@onready var credits_menu: Control = %CreditsMenu


func _ready() ->void:
	#two lambda functions hide and show the credits menu
	credits_button.pressed.connect(func() ->void: credits_menu.visible = true)
	back_button.pressed.connect(func() ->void: credits_menu.visible = false)

	#when the play game button is pressed, a function triggers to initiate the start of the game
	play_game_button.pressed.connect(start_game)

##This function initiates the start of the game when pressed
func start_game() ->void: 
	get_tree().change_scene_to_file("uid://8wp4j67gb5hi") #loads game_scene.tscn
