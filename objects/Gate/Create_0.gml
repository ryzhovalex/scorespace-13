function check_ball_collision() {
    var ball = instance_place(x, y, Ball) 
    
    // only hitted balls can be scored
    if ball != noone {
        if ball.is_hitted {
            ball.score_gate()
        }
    }
}

