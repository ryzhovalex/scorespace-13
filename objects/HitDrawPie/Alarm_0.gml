_tick_lock = false

_value -= _tick_step

if _value <= _max_value / 5 {
    _current_color = _color_high
} else if _value <= _max_value / 2 {
    _current_color = _color_middle
} else {
    _current_color = _color_low
}




