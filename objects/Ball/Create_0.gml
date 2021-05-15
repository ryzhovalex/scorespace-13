initial_speed = 1
bounce_extra_speed = 0.2 // how much speed ball will gain after bouncing of a wall

function bounce() {
    speed += bounce_extra_speed 
}

function check_wall_collision() {
    var court_width = room_width - 64
    var court_height = room_height - 64 
    
    // top
    if floor(y) <= 64 {
        y = 64 + 1
        direction = 360 - direction 
        bounce()
    }
    
    // left
    if floor(x) <= 64 {
        x = 64 + 1
        direction = 180 - direction        
        bounce()
    }
    
    // bot
    if floor(y) >= court_height {
        y = court_height - 1
        direction = 360 - direction 
        bounce()
    }
    
    // right
    if floor(x) >= court_width {
        x = court_width - 1
        direction = 180 - direction        
        bounce()
    }
}

speed += initial_speed
