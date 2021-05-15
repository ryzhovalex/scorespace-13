move_speed = 3
hp = 100
hit_radius = 180
hit_cooldown = 5 * room_speed
hit_strength = 10


function move(move_up_key, move_left_key, move_down_key, move_right_key) {
    // TODO: solve problem with diagonal speed which higher than direct speed
    var move_x = keyboard_check(move_right_key) - keyboard_check(move_left_key)
    var move_y = keyboard_check(move_down_key) - keyboard_check(move_up_key)
    
    var hsp = move_x * move_speed
    var vsp = move_y * move_speed
    
    // collisions algo from here: https://www.youtube.com/watch?v=IysShLIaosk
    // TODO: refactor this shit
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

















