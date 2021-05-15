is_paused = false
character_spawn_coord = [640, 360]
is_spawned_player = false

function spawn_character() {
    if !is_spawned_player {
        character = instance_create_depth(character_spawn_coord[0], character_spawn_coord[1], 0, Character)
        is_spawned_player = true
    }
}

function pause() {
    if !is_paused {
        is_paused = true
        
        for (var i = 0; i < instance_number(BuiltInSpeedUser); i++) {
            var instance = instance_find(BuiltInSpeedUser, i)
            debug(instance)
            
            if instance != noone {
                instance.speed_backup = instance.speed
                instance.speed = 0
            }
        }
    } else {
        is_paused = false
        
        for (var i = 0; i < instance_number(BuiltInSpeedUser); i++) {
            var instance = instance_find(BuiltInSpeedUser, i)
            
            if instance != noone {
                instance.speed = instance.speed_backup
            }
        }
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

