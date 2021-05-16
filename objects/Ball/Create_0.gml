event_inherited()
initial_speed = 0.5
bounce_extra_speed = 0.1 // how much speed ball will gain after bouncing of a wall
max_speed = 10 
is_hitted = false // true if hitted by character, sets to false if ball reaches wall instead of gate

function add_speed(ms) {
    if speed + ms > max_speed {
        speed = max_speed
    }
    
    speed += ms 
}

function bounce(position) {
    change_hitted_condition(false)
    add_speed(bounce_extra_speed)
    
    switch position {
        case "top":
            direction = 360 - direction 
            break
        case "left":
            direction = 180 - direction        
            break
        case "bot":
            direction = 360 - direction 
            break
        case "right":
            direction = 180 - direction        
            break
    }
}

function charge(force, dir) {
    change_hitted_condition(true)
    add_speed(force)
    direction = dir
}

function change_hitted_condition(mode_enabled) {
    if !is_undefined(mode_enabled) {
        is_hitted = mode_enabled
    } 
    
    if is_hitted {
        sprite_index = sp_test_ball_hitted 
    } else {
        sprite_index = sp_test_ball
    }
}

function check_wall_collision() {
    // TODO: unhardcode court vars
    var court_width = room_width - 64
    var court_height = room_height - 64 
    var sp_width_divided = sprite_width / 2
    
    // top
    if floor(y - sp_width_divided) <= 64 {
        y = 64 + sp_width_divided
        bounce("top")
    }
    
    // left
    if floor(x - sp_width_divided) <= 64 {
        x = 64 + sp_width_divided
        bounce("left")
    }
    
    // bot
    if floor(y + sp_width_divided) >= court_height {
        y = court_height - sp_width_divided
        bounce("bot")
    }
    
    // right
    if floor(x + sp_width_divided) >= court_width {
        x = court_width - sp_width_divided
        bounce("right")
    }
}

function score_gate() {
    instance_destroy(self)
} 

speed += initial_speed






