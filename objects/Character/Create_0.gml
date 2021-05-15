image_speed = 0

move_speed = 3
hp = 100

hit_cooldown = 5 * room_speed
hit_force = 10
hit_radius = 180
hit_distance = 25

_vision_sector = 0 // =0: sector -90|90; =90: sector 0|180 ... etc.

function change_direction() {
    direction = point_direction(x, y, mouse_x, mouse_y) 
    _vision_sector = _calculate_vision_sector()
    
    switch _vision_sector {
        case 0:
            image_index = 0
            break
        case 90:
            image_index = 1
            break
        case 180:
            image_index = 2
            break
        case 270:
            image_index = 3
            break
    }
}

function move(move_up_key, move_left_key, move_down_key, move_right_key) {
    // TODO: solve problem with diagonal speed which higher than direct speed
    var move_x = keyboard_check(move_right_key) - keyboard_check(move_left_key)
    var move_y = keyboard_check(move_down_key) - keyboard_check(move_up_key)
    
    var hsp = move_x * move_speed
    var vsp = move_y * move_speed
    
    // collisions algo from here: https://www.youtube.com/watch?v=IysShLIaosk
    // TODO: refactor these shit below
    if place_meeting(x+hsp, y, Wall) {
        while !place_meeting(x+sign(hsp), y, Wall) {
            x += sign(hsp)
        }
        hsp = 0
    }
    
    if place_meeting(x, y+vsp, Wall) {
        while !place_meeting(x, y+sign(vsp), Wall) {
            y += sign(vsp)
        }
        vsp = 0
    } 
    
    x += hsp
    y += vsp
}

function hit() {
    for (var i = 0; i < instance_number(Ball); i++) {
        var ball = instance_find(Ball, i)
        
        if ball != noone {
            var distance_to_ball = point_distance(x, y, ball.x, ball.y)
            var direction_to_ball = point_direction(x, y, ball.x, ball.y)
            var is_ok_distance = distance_to_ball <= hit_distance 
            var is_ok_direction = direction_to_ball >= direction - hit_radius / 2 || direction_to_ball <= direction + hit_radius / 2  
            
            if is_ok_distance && is_ok_direction {
                ball.charge(hit_force, direction)
            }        
        }
    }
}

function _calculate_vision_sector() {
    if direction >= -90 && direction < 90 {
        return 0
    } 
    
    if direction >= 0 && direction < 180 {
        return 90
    }
    
    if direction >= 90 && direction < 270 {
        return 180
    }
    
    if direction >= 180 && direction < 360 {
        return 270
    }
}

function check_ball_collision() {
    var ball = instance_place(x, y, Ball)
    
    if ball != noone {
        
    }
}

















