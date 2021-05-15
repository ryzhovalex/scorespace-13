// get keybindings from config
script_execute(game_keybindings)

game = instance_create_depth(x, y, 0, Game)

function _loop() {
    if keyboard_check_pressed(spawn_player_key) {
        game.spawn_character()
    }
    
    if keyboard_check_pressed(change_screen_mode_key) {
        game.change_screen_mode()
    }
    
    if keyboard_check_pressed(exit_game_key) {
        game.exit_game()
    }
}
