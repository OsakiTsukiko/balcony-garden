extends Control

onready var btn_start = $CanvasLayer/VBoxContainer/HBoxContainerStart/ButtonStart
onready var lbl_start = $CanvasLayer/VBoxContainer/HBoxContainerStart/Arrow
onready var pad_start = $CanvasLayer/VBoxContainer/HBoxContainerStart/Padding

onready var btn_exit = $CanvasLayer/VBoxContainer/HBoxContainerExit/ButtonExit
onready var lbl_exit = $CanvasLayer/VBoxContainer/HBoxContainerExit/Arrow
onready var pad_exit = $CanvasLayer/VBoxContainer/HBoxContainerExit/Padding

onready var btn_options = $CanvasLayer/VBoxContainer/HBoxContainerOptions/ButtonOptions
onready var lbl_options = $CanvasLayer/VBoxContainer/HBoxContainerOptions/Arrow
onready var pad_options = $CanvasLayer/VBoxContainer/HBoxContainerOptions/Padding

onready var select_l = $AudioStreamPlayerSelect.stream.get_length()
onready var confirm_l = $AudioStreamPlayerConfirm.stream.get_length()

onready var SceneTree = get_tree()

func _ready():
	btn_start.connect("pressed", self, "_on_ButtonStart_pressed")
	btn_exit.connect("pressed", self, "_on_ButtonExit_pressed")
	btn_options.connect("pressed", self, "_on_ButtonOptions_pressed")
	
	btn_start.connect("mouse_entered", self, "_on_ButtonStart_mouse_entered")
	btn_exit.connect("mouse_entered", self, "_on_ButtonExit_mouse_entered")
	btn_options.connect("mouse_entered", self, "_on_ButtonOptions_mouse_entered")
	
	btn_start.connect("mouse_exited", self, "_on_ButtonStart_mouse_exited")
	btn_exit.connect("mouse_exited", self, "_on_ButtonExit_mouse_exited")
	btn_options.connect("mouse_exited", self, "_on_ButtonOptions_mouse_exited")

func _on_ButtonStart_pressed():
	$AudioStreamPlayerConfirm.play()
	$Timer.wait_time = confirm_l - 0.3
	$Timer.connect("timeout", self, "_on_Timer_timeoutStart")
	$Timer.start()

func _on_ButtonExit_pressed():
	$AudioStreamPlayerConfirm.play()
	$Timer.wait_time = confirm_l - 0.3
	$Timer.connect("timeout", self, "_on_Timer_timeoutExit")
	$Timer.start()

func _on_ButtonOptions_pressed():
	$AudioStreamPlayerConfirm.play()
	$Timer.wait_time = confirm_l - 0.3
	$Timer.connect("timeout", self, "_on_Timer_timeoutOptions")
	$Timer.start()

func _on_Timer_timeoutStart():
	print("yes")
	if get_tree().get_nodes_in_group("SceneManager")[0].has_method("load_scene"):
		get_tree().get_nodes_in_group("SceneManager")[0].load_scene("room_scene")

func _on_Timer_timeoutExit():
	get_tree().quit()

func _on_Timer_timeoutOptions():
	pass

func _on_ButtonStart_mouse_entered():
	lbl_start.visible = true
	pad_start.visible = false
	$AudioStreamPlayerSelect.play()

func _on_ButtonExit_mouse_entered():
	lbl_exit.visible = true
	pad_exit.visible = false
	$AudioStreamPlayerSelect.play()

func _on_ButtonOptions_mouse_entered():
	lbl_options.visible = true
	pad_options.visible = false
	$AudioStreamPlayerSelect.play()

func _on_ButtonStart_mouse_exited():
	lbl_start.visible = false
	pad_start.visible = true

func _on_ButtonExit_mouse_exited():
	lbl_exit.visible = false
	pad_exit.visible = true

func _on_ButtonOptions_mouse_exited():
	lbl_options.visible = false
	pad_options.visible = true
