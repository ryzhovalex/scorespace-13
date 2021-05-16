_score_model = instance_create_depth(x, y, 0, Score)
_score_interface = instance_create_depth(x, y, 0, ScoreInterface)
_final_interface_initialized = false

function loop() {
    _score_model.period()
}

function loop_pause_invincible() {
    var game = instance_find(Game, 0)
    
    if game.ended_by_defeat && !_final_interface_initialized {
        _final_interface_initialized = true
        _score_model.calculate_total_score()
        _score_model.calculate_best_score()
        var survival_score = _score_model.survival_score
        var goals_score = _score_model.goals_score
        var total_score = _score_model.total_score
        var best_score = _score_model.best_score
        _score_interface.enable_mode_final_score(survival_score, goals_score, total_score, best_score)
    }
}
