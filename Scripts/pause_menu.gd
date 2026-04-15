extends Control

func resume():
	get_tree().paused = false
	
func pause():
	get_tree().paused = true

func callPauseMenu():
	if Input.is_action_just_pressed("ui_cancel") and get_tree().paused == false:
		visible = true
		pause()
	elif Input.is_action_just_pressed("ui_cancel") and get_tree().paused == true:
		visible = false
		resume()

func _on_resume_pressed() -> void:
	resume()

func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()


func _on_quit_pressed() -> void:
	get_tree().quit()
	
func _process(delta):
	callPauseMenu()
