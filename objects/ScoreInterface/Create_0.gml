_survival_score = 0
_goals_score = 0
_total_score = 0
_best_score = 0

_mode_final_score_enabled = false

// top left point of an interface
_x0_interface_final_score = 250
_y0_interface_final_score = 250

function enable_mode_final_score(survival_score, goals_score, total_score, best_score) {
    _mode_final_score_enabled = true 
    _survival_score = survival_score
    _goals_score = goals_score
    _total_score = total_score
    _best_score = best_score
}

function _draw_final_score() {
    // draw events according to x0 and y0 interface coords
    draw_set_color(c_red)
    draw_text(_x0_interface_final_score, _y0_interface_final_score, string(_best_score))
}
