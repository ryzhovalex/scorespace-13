total_score = 0
survival_score = 0
goals_score = 0
best_score = 0

_survival_prize_points = 50 // how many points will be given for the period of time
_survival_prize_period_seconds = 1 * room_speed // how frequently survival prize will be added to score

_best_score_file_directory = working_directory + "bs"

_alarm0_lock = false

function period() {
    if !_alarm0_lock {
        _alarm0_lock = true
        alarm[0] = _survival_prize_period_seconds
    }
    
    calculate_total_score()
}

function goal(prize_points) {
    goals_score += prize_points 
}

function calculate_total_score() {
    total_score = survival_score + goals_score
}

function calculate_best_score() {
    var file_read = file_text_open_read(_best_score_file_directory)
    
    if file_read == -1 {
        _initialize_best_score_file()
        file_read = file_text_open_read(_best_score_file_directory)
    }
    
    var data = file_text_readln(file_read)
    
    best_score = real(base64_decode(data))
    file_text_close(file_read)
    
    if total_score > best_score {
        best_score = total_score    
        _rewrite_best_score_file(best_score)
    }
}

function _rewrite_best_score_file(data) {
    var file_write = file_text_open_write(_best_score_file_directory)
    var data_encoded = base64_encode(string(data))
    file_text_write_string(file_write, data_encoded)
    file_text_close(file_write)
}

function _initialize_best_score_file() {
    var file_write = file_text_open_write(_best_score_file_directory)
    file_text_write_string(file_write, base64_encode("0"))
    file_text_close(file_write)
}
