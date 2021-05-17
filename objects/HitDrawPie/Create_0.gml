pinned_character = noone

_x_margin = 36
_y_margin = 42
_x = x +_x_margin
_y = y - _y_margin
_max_value = 100
_value = _max_value 
_color_high = c_red
_color_middle = c_orange
_color_low = c_green
_current_color = c_red
_radius = 15
_transparency = 1
_tick_lock = false
_tick_step = 10

function refresh_position() {
    _x = pinned_character.x +_x_margin
    _y = pinned_character.y - _y_margin
}

function period() {
    refresh_position()
    var tick_time = pinned_character.hit_cooldown / (_max_value / _tick_step)
    
    if _value > 0 {
        if !_tick_lock {
            _tick_lock = true
            alarm[0] = tick_time
        }
    } else {
        _value = _max_value
        instance_destroy(self)
    }
}
