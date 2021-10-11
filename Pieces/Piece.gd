extends Node2D

export (String) var color
var is_matched
var is_counted
var selected = false
var target_position = Vector2(0,0)
var default_modulate = Color(1,1,1,1)
var highlight = Color(1,0.8,0,1)

var sound_1 = null
var sound_2 = null

var die = preload("res://BreakAnim/Break.tscn")

var dying = false

func _ready():
	default_modulate = modulate

func _physics_process(_delta):
	if dying:
		queue_free()
	if selected:
		if modulate != highlight:
			modulate = highlight
	else:
		if modulate != default_modulate:
			modulate = default_modulate
		

func move_piece(change):
	target_position = position + change
	position = target_position
	if sound_1 == null:
		sound_1 = get_node_or_null("/root/Game/mouthpop")
	if sound_1 != null:
		sound_1.play()
	

func die():
	dying = true;
	if sound_2 == null:
		sound_2 = get_node_or_null("/root/Game/die")
	if sound_2 != null:
		sound_2.play()
