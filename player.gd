extends CharacterBody2D

var move_speed: float = 100.0
var jump_force: float = 200.0
var gravity: float = 500.0

var score: int = 0
@onready var score_text: Label = $CanvasLayer/Label

# delta est une valeur permettant, quand utilisé, de convertir une action "per frame" en "per second". (Rappel que la fonction _physics_process est appelée à chaque frame)
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	
	velocity.x = 0;

	if Input.is_key_pressed(KEY_LEFT):
		velocity.x -= move_speed

	if Input.is_key_pressed(KEY_RIGHT):
		velocity.x += move_speed

	if Input.is_key_pressed(KEY_UP) and is_on_floor():
		velocity.y = -jump_force
	

	move_and_slide()

	if global_position.y > 300:
		game_over()

func game_over() -> void:
	get_tree().reload_current_scene()

func add_score(amount: int) -> void:
	score += amount
	score_text.text = "Score : " + str(score)
	print("Score : ", score)