owner = noone
live_time = noone	//_hit_animation_time from character in hit()
hitted_balls = []
image_alpha = 0.6
image_speed = 3

_pause_waited = false
_alarm0_lock = false

function period() {
    if !_alarm0_lock {
        _alarm0_lock = true
        alarm[0] = live_time    
    }
	
	// Animation
	if image_index == 3
		image_speed = 0
    
    var xx_owner = owner.lengthdir_x(owner.hit_distance, direction)
    var yy_owner = owner.lengthdir_y(owner.hit_distance, direction)
    x = owner.x + xx_owner
    y = owner.y + yy_owner
    
    _check_ball_collision()
}

function _check_ball_collision() {
    var ball = instance_place(x, y, Ball)
    
    if ball != noone && !_is_ball_already_hitted(ball) {
        ball.charge(owner.hit_force, owner.direction)
        array_set(hitted_balls, array_length(hitted_balls), ball)
    }
}

function _is_ball_already_hitted(ball) {
    for (var i = 0; i < array_length(hitted_balls); i++) {
        if ball == hitted_balls[i] {
            return true
        }
    }
    
    return false
}

function _destroy_self() {
    var game = instance_find(Game, 0)
    
    if !game.is_paused {
        instance_destroy(self)
    } else {
        _pause_waited = true
    }
}
