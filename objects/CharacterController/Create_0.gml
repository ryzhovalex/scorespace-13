event_inherited()

function _find_character() {
    return instance_find(Character, 0)
}

_character = noone

function loop() {
    if _character != noone {
        script_execute(character_keybindings)
        _character.check_ball_collision()
        _character.change_direction()
        _character.move(move_up_key, move_left_key, move_down_key, move_right_key)
        
        if mouse_check_button_released(hit_key) {
            _character.hit()
        }
    } else {
        _character = _find_character()
    }
}

