is_paused = true

character_spawn_coord = [640, 360]
is_spawned_player = false



function spawn_character() {
    if !is_spawned_player {
        character = instance_create_depth(character_spawn_coord[0], character_spawn_coord[1], 0, Character)
        is_spawned_player = true
    }
}

function change_screen_mode() {
    if window_get_fullscreen() {
        window_set_fullscreen(false)
    } else {
        window_set_fullscreen(true)
    }
}

function exit_game() {
    game_end()
}

