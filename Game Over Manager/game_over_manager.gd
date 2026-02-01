extends Node2D

@onready var ball_game_over_plane: Area2D = %BallGameOverPlane
@onready var germ_game_over_plane: Area2D = %GermGameOverPlane
@onready var game_over_menu: Control = %GameOverMenu

@onready var retry_button: Button = %RetryButton
@onready var main_menu_button: Button = %MainMenuButton

func _ready() ->void:
	game_over_menu.visible = false
	ball_game_over_plane.connect("game_ended",game_over)
	germ_game_over_plane.connect("game_ended",game_over)
	retry_button.pressed.connect(reload_game)
	main_menu_button.pressed.connect(go_to_main_menu)

func game_over() ->void:
	game_over_menu.visible = true
	get_tree().paused = true

func reload_game() ->void:
	get_tree().paused = false
	get_tree().change_scene_to_file("uid://8wp4j67gb5hi") #loads game_scene.tscn

func go_to_main_menu() ->void:
	get_tree().paused = false
	get_tree().change_scene_to_file("uid://b33yhwxamtj01") #loads MainMenu.tscn
	
