extends Area2D

var bob_height: float = 5.0
var bob_speed: float = 5.0

@onready var start_y: float = global_position.y
var t: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	body_entered.connect(_on_body_entered)

func _process(delta):
	t += delta
	var d = (sin(t * bob_speed) + 1) / 2
	global_position.y = start_y + d * bob_height

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.add_score(1)
		queue_free()
