event_inherited()

// get keybindings from config
script_execute(game_keybindings)

game = instance_create_depth(x, y, 0, Game)

function loop() {
    exit
}

function loop_pause_invincible() {
	if game.is_paused {
		game.remove_builtin_pause_speed()		
	}
	
    if keyboard_check_pressed(spawn_player_key) {
        game.spawn_character()
    }
    
    if keyboard_check_pressed(restart_key) && game.ended_by_defeat {
    	game.restart()
    }
    
    if keyboard_check_pressed(change_screen_mode_key) {
        game.change_screen_mode()
    }
    
    if keyboard_check_pressed(exit_game_key) {
        game.exit_game()
    }
    
    if keyboard_check_released(pause_game_key) {
        game.pause()
    }
}
