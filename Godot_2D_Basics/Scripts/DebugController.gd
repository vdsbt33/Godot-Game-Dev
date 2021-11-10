extends Node

var DebugTextComponent : TextEdit;

func _ready():
	DebugTextComponent = get_node("../DebugTextComponent");
	var playerNode = get_node("../Player");
	print(playerNode);
	playerNode.connect('changed_velocity', self, '_setText');

func _process(delta):
	pass;

func _setText(value):
	DebugTextComponent.text = str(value);
