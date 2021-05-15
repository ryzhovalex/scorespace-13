function _find_character() {
    return instance_find(Character, 0)
}

_character = noone

function _loop() {
    if _character != noone {
        script_execute(character_keybindings)
        _character.move(move_up_key, move_left_key, move_down_key, move_right_key)
    } else {
        _character = _find_character()
    }
}
