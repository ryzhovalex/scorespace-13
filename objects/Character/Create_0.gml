image_speed = 0

move_speed = 3
lifes = 1

hit_cooldown = 2 * room_speed
hit_force = 0.3
hit_radius = 180
hit_distance = 100
_hit_performed_recently = false 
_hit_animation_time = 1 * room_speed

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
    // TODO: refactor this shit below
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
    if !_hit_performed_recently {
        _hit_performed_recently = true
        sprite_index = sp_test_character_hit
        alarm[0] = _hit_animation_time // enable animation
        alarm[1] = hit_cooldown // start cooldown
        _enable_hit_draw_pie() 
        _iterate_balls_to_hit()
    } 
}

function _enable_hit_draw_pie() {
    var pie = instance_create_depth(x, y, 0, HitDrawPie)
    pie.pinned_character = self
}


function _iterate_balls_to_hit() {
    for (var i = 0; i < instance_number(Ball); i++) {
        var ball = instance_find(Ball, i)
        
        if ball != noone {
            var distance_to_ball = point_distance(x, y, ball.x, ball.y)
            var direction_to_ball = point_direction(x, y, ball.x, ball.y)
            var is_ok_distance = distance_to_ball <= hit_distance 
            
            var vision_sector_point_high = _vision_sector + hit_radius / 2 
            var vision_sector_point_low = _vision_sector - hit_radius / 2
            var is_ok_direction1 = direction_to_ball >= vision_sector_point_low
            var is_ok_direction2 = direction_to_ball <= vision_sector_point_high
            var is_ok_direction = is_ok_direction1 && is_ok_direction2
            
            if is_ok_distance && is_ok_direction {
                // debug(">>> BALL HITTED")
                // debug(">>> DIRECTION TO BALL: " + string(direction_to_ball))
                // debug(">>> VISION SECTOR: " + string(_vision_sector))
                // debug(">>> VISION SECTOR POINT LOW: " + string(vision_sector_point_low))
                // debug(">>> VISION SECTOR POINT HIGH: " + string(vision_sector_point_high))
                ball.charge(hit_force, direction)
            }        
        }
    }
}

function _calculate_vision_sector() {
    if direction >= 315 || direction < 45 {
        return 0
    } 
    
    if direction >= 45 && direction < 135 {
        return 90
    }
    
    if direction >= 135 && direction < 225 {
        return 180
    }
    
    if direction >= 225 && direction < 315 {
        return 270
    }
}

function check_ball_collision() {
    var ball = instance_place(x, y, Ball)
    
    if ball != noone {
        remove_life()      
    }
}

function remove_life() {
    lifes -= 1
    
    var game = instance_find(Game, 0)
    
    if lifes == 0 {
        game.defeat() 
    }
}
