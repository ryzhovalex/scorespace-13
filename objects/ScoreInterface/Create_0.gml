_survival_score = 0
_goals_score = 0
_total_score = 0
_best_score = 0

_mode_final_score_enabled = false

// top left point of an interface
_x0_interface_final_score = 318
_y0_interface_final_score = 86

function enable_mode_final_score(survival_score, goals_score, total_score, best_score) {
    _mode_final_score_enabled = true 
    _survival_score = survival_score
    _goals_score = goals_score
    _total_score = total_score
    _best_score = best_score
}

// SEMEN TYPE HERE >>>>
function _draw_final_score() {
    // draw events according to x0 and y0 interface coords
    draw_set_font(font_komika)
	draw_set_color(c_white)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_text_outline(_x0_interface_final_score, _y0_interface_final_score, c_white, c_black,
		"Survival time: " +string(_survival_score) + "\n"
		+ "Balls scored: " +string(_goals_score) + "\n"
		+ "Total score: " +string(_total_score) + "\n\n"
		+ "Best score: " +string(_best_score) +"\n\n"
		+ "Press R to restart",
		74, 1200)
} 
// <<<<
