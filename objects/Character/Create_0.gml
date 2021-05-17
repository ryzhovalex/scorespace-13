image_speed = 0

move_speed = 3.3
lifes = 1

hit_cooldown = 1 * room_speed
hit_force = 2.3
hit_distance = 40

// Animation
anim_spd = 0.3
global.move_x = 0
global.move_y = 0

_hit_performed_recently = false 
_hit_animation_time = 0.1 * room_speed

_vision_sector = 0 // =0: sector -90|90; =90: sector 0|180 ... etc.


function change_direction() {
    direction = point_direction(x, y, mouse_x, mouse_y) 
    _vision_sector = _calculate_vision_sector()
    
    switch _vision_sector {
        case 0:
			//image_index = 0
            break
        case 90:
            //image_index = 1
            break
        case 180:
            //image_index = 2
            break	
        case 270:
            //image_index = 3
            break
    }
}

function move(move_up_key, move_left_key, move_down_key, move_right_key) {
    // TODO: solve problem with diagonal speed which higher than direct speed
	// Remove local for animation
    global.move_x = keyboard_check(move_right_key) - keyboard_check(move_left_key)
    global.move_y = keyboard_check(move_down_key) - keyboard_check(move_up_key)
    
    var hsp = global.move_x * move_speed
    var vsp = global.move_y * move_speed
    
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
        // sprite_index = sp_test_character_hit
        
        var xx_moscito = x + lengthdir_x(hit_distance, direction)
        var yy_moscito = y + lengthdir_y(hit_distance, direction)
        var moscito = instance_create_depth(xx_moscito, yy_moscito, 0, HitMoscito)
        moscito.owner = self
        moscito.live_time = _hit_animation_time
        moscito.direction = direction
        moscito.image_angle = direction
        
        alarm[0] = _hit_animation_time // enable animation
        alarm[1] = hit_cooldown // start cooldown
        _enable_hit_draw_pie() 
		
		var _sounds = [sn_swing_0, sn_swing_1, sn_swing_2, sn_swing_3]
		
		if global.sfx == 1
			audio_play_sound(_sounds[irandom(array_length(_sounds)-1)], 1, false)
    } 
}

function _enable_hit_draw_pie() {
    var pie = instance_create_depth(x, y, 0, HitDrawPie)
    pie.pinned_character = self
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
	
	if global.sfx == 1
		audio_play_sound(sn_hurt, 1, false)
}
